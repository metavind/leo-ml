import argparse
import json


def generate_nn_code(input_dim, output_dim, model_data):
    indentation = "    "

    # Helper function to generate the explicit model initialization
    def generate_model_initialization():
        layer_inits = []
        idx = 1

        while f'l{idx}_weights' in model_data and f'l{idx}_biases' in model_data:
            output_size = len(model_data.get(f'l{idx}_biases', []))
            input_size = len(model_data.get(
                f'l{idx}_weights', [])) // output_size

            weights = "\n".join(
                [f"{indentation*4}i{i+1}_o{j+1}: {model_data.get(f'l{idx}_weights', [])[j*input_size + i]}i128," for j in range(
                    output_size) for i in range(input_size)]
            )
            biases = "\n".join(
                [f"{indentation*4}b{j+1}: {model_data.get(f'l{idx}_biases', [])[j]}i128," for j in range(
                    output_size)]
            )

            layer_inits.append(
                f"{indentation*3}l{idx}: L{idx} {{\n{weights}\n{biases}\n{indentation*3}}},")
            idx += 1

        # Initialization for output layer
        output_size = len(model_data.get('lo_biases', []))
        input_size = len(model_data.get('lo_weights', [])) // output_size

        output_weights = "\n".join(
            [f"{indentation*4}i{i+1}_o{j+1}: {model_data.get('lo_weights', [])[j*output_size + i]}i128," for i in range(
                input_size) for j in range(output_size)]
        )
        output_biases = "\n".join(
            [f"{indentation*4}b{j+1}: {model_data.get('lo_biases', [])[j]}i128," for j in range(
                output_size)]
        )
        layer_inits.append(
            f"{indentation*3}lo: Lo {{\n{output_weights}\n{output_biases}\n{indentation*3}}},")

        return "\n".join(layer_inits)

    # Helper function to generate layer weights and biases
    def generate_layer_struct(layer_idx, input_size, output_size):
        weights = "\n".join(
            [f"{indentation*2}i{i+1}_o{j+1}: i128," for j in range(
                output_size) for i in range(input_size)]
        )
        biases = "\n".join(
            [f"{indentation*2}b{j+1}: i128," for j in range(
                output_size)]
        )
        return f"{indentation}struct L{layer_idx} {{\n{weights}\n{biases}\n{indentation}}}"

    # Helper function to generate layer computation
    def generate_layer_computation(layer_idx, input_size, output_size, prev_layer_idx=None, is_output=False):
        if prev_layer_idx:
            inputs = [
                f"val_l{prev_layer_idx}_{i+1}" for i in range(input_size)]
        else:
            inputs = [f"data.i{i+1}" for i in range(input_size)]

        if is_output:
            computation = "\n".join(
                [f"{indentation*2}let val_l{layer_idx}_{j+1}: i128 = " +
                 " + ".join([f'model.l{layer_idx}.i{i+1}_o{j+1} * {inputs[i]}' for i in range(input_size)]) +
                 f" + model.l{layer_idx}.b{j+1};" for j in range(output_size)]
            )
        else:
            computation = "\n".join(
                [f"{indentation*2}let val_l{layer_idx}_{j+1}: i128 = relu(" +
                 " + ".join([f'model.l{layer_idx}.i{i+1}_o{j+1} * {inputs[i]}' for i in range(input_size)]) +
                 f" + model.l{layer_idx}.b{j+1});" for j in range(output_size)]
            )

        return computation

    # Generate the model initialization
    model_initialization = f"{indentation*2}let model: NeuralNet = NeuralNet {{\n"
    model_initialization += generate_model_initialization()
    model_initialization += f"\n{indentation*2}}};"

    # Generate the input struct
    input_struct = f"struct Input {{\n"
    input_struct += "\n".join(
        [f"{indentation*2}i{i+1}: i128," for i in range(input_dim)])
    input_struct += f"\n{indentation}}}"

    # Generate all hidden layer structs and computations based on model_data
    layer_structs = []
    layer_computations = []
    idx = 1
    prev_layer_size = input_dim

    while f'l{idx}_weights' in model_data and f'l{idx}_biases' in model_data:
        output_size = len(model_data.get(f'l{idx}_biases', []))
        input_size = len(model_data.get(f'l{idx}_weights', [])) // output_size

        layer_structs.append(generate_layer_struct(
            idx, input_size, output_size))
        layer_computations.append(generate_layer_computation(
            idx, input_size, output_size, idx-1 if idx > 1 else None))

        prev_layer_size = output_size
        idx += 1

    # Generate output layer struct and computation
    output_size = len(model_data.get('lo_biases', []))
    layer_structs.append(generate_layer_struct(
        'o', prev_layer_size, output_size))
    layer_computations.append(generate_layer_computation(
        'o', prev_layer_size, output_size, idx-1, is_output=True))

    # Argmax computation for output
    conditions = "\n".join(
        [f"{indentation*2}if val_{i+1} > max_val {{\n{indentation*3}max_val = val_{i+1};\n{indentation*3}max_idx = {i+1}u8;\n{indentation*2}}}" for i in range(1, output_dim)])

    arg_max_function = f"""
    function arg_max({', '.join([f'val_{i+1}: i128' for i in range(output_dim)])}) -> u8 {{
{indentation*2}let max_val: i128 = val_1;
{indentation*2}let max_idx: u8 = 1u8;
{conditions}
{indentation*2}return max_idx;
    }}
    """

    # Composing the final Aleo code
    code = """program nn.aleo {{
    // Neural Network Multi Layer Model

    // Define the ReLU activation function
    function relu(x: i128) -> i128 {{
        if x > 0i128 {{
            return x;
        }} else {{
            return 0i128;
        }}
    }}

    {arg_max_function}

    // Input struct
    {input_struct}

    // Layer structs
{layer_structs_text}

    // Neural Network consisting of multiple layers
    struct NeuralNet {{
{layers_list},
        lo: Lo,
    }}

    // The main function that takes input and produces an output
    transition compute(data: Input) -> u8 {{
{model_initialization}
{layer_computations_text}
        return arg_max({output_val_list});
    }}
}}""".format(
        arg_max_function=arg_max_function,
        input_struct=input_struct,
        layer_structs_text="\n".join(layer_structs),
        layers_list=',\n'.join(
            [f'{indentation*2}l{idx}: L{idx}' for idx in range(1, len(model_data) // 2)]),
        model_initialization=model_initialization,
        layer_computations_text="\n".join(layer_computations),
        output_val_list=', '.join([f'val_lo_{i+1}' for i in range(output_dim)])
    )

    return code


if __name__ == "__main__":
    parser = argparse.ArgumentParser(
        description="Generate Aleo code for a single layer neural network.")
    parser.add_argument('--input_dim', type=int,
                        help="The dimension of the input.")
    parser.add_argument('--model_file', type=str,
                        help="The file containing the model data.")
    parser.add_argument('--output_dim', type=int,
                        help="The dimension of the output.")
    parser.add_argument('--output_file', type=str, default="main.leo",
                        help="The file to write the Aleo code to.")

    args = parser.parse_args()

    # Opening JSON file
    with open(args.model_file) as json_file:
        model_data = json.load(json_file)

    aleo_code = generate_nn_code(
        args.input_dim, args.output_dim, model_data)

    with open(args.output_file, 'w') as f:
        f.write(aleo_code)

    print(f"Written to {args.output_file}")
