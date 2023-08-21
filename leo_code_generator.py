import argparse
import json


def generate_nn_code(program_name, model_data):
    indentation = "    "

    # Infer input_dim and total number of layers from model_data
    idx = 1
    while f'l{idx}_weights' in model_data and f'l{idx}_biases' in model_data:
        idx += 1
    total_layers = idx - 1
    input_dim = len(model_data.get('l1_weights', [])
                    ) // len(model_data.get('l1_biases', []))

    # Helper function to generate the explicit model initialization
    def generate_model_initialization():
        layer_inits = []
        for idx in range(1, total_layers + 1):
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
        return "\n".join(layer_inits)

    # Helper function to generate layer weights and biases
    def generate_layer_struct(layer_idx, input_size, output_size):
        weights = "\n".join(
            [f"{indentation*2}i{i+1}_o{j+1}: i128," for j in range(
                output_size) for i in range(input_size)]
        )
        biases = "\n".join(
            [f"{indentation*2}b{j+1}: i128," for j in range(output_size)]
        )
        return f"{indentation}struct L{layer_idx} {{\n{weights}\n{biases}\n{indentation}}}"

    # Helper function to generate layer computation
    def generate_layer_computation(layer_idx, input_size, output_size, prev_layer_idx=None):
        if prev_layer_idx:
            inputs = [
                f"val_l{prev_layer_idx}_{i+1}" for i in range(input_size)]
        else:
            inputs = [f"data.in{i+1}" for i in range(input_size)]

        if layer_idx == total_layers:
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
        [f"{indentation*2}in{i+1}: i128," for i in range(input_dim)])
    input_struct += f"\n{indentation}}}"

    # Generate all layer structs and computations based on model_data
    layer_structs = []
    layer_computations = []
    for idx in range(1, total_layers + 1):
        output_size = len(model_data.get(f'l{idx}_biases', []))
        input_size = len(model_data.get(f'l{idx}_weights', [])) // output_size

        layer_structs.append(generate_layer_struct(
            idx, input_size, output_size))
        layer_computations.append(generate_layer_computation(
            idx, input_size, output_size, idx-1 if idx > 1 else None))

    # Argmax computation for final layer
    output_dim = len(model_data.get(f'l{total_layers}_biases', []))
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
    code = """program {program_name}.aleo {{
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
    }}

    // The main function that takes input and produces an output
    transition compute(data: Input) -> public u8 {{
{model_initialization}
{layer_computations_text}
        return arg_max({output_val_list}) - 1u8;
    }}
}}""".format(
        program_name=program_name,
        arg_max_function=arg_max_function,
        input_struct=input_struct,
        layer_structs_text="\n".join(layer_structs),
        layers_list=',\n'.join(
            [f'{indentation*2}l{idx}: L{idx}' for idx in range(1, total_layers + 1)]),
        model_initialization=model_initialization,
        layer_computations_text="\n".join(layer_computations),
        output_val_list=", ".join(
            [f"val_l{total_layers}_{i+1}" for i in range(output_dim)])
    )

    return code


if __name__ == "__main__":
    parser = argparse.ArgumentParser(
        description="Generate Aleo code for Neural Network.")
    parser.add_argument('--model_data', required=True, type=str,
                        help='Path to JSON file containing model data.')
    parser.add_argument('--output', default="src/main.leo", type=str,
                        help='Path to output Aleo code file.')
    parser.add_argument('--program_name', required=True,
                        type=str, help='Name of the Aleo program.')
    args = parser.parse_args()

    with open(args.model_data, 'r') as f:
        model_data = json.load(f)

    code = generate_nn_code(args.program_name, model_data)

    with open(args.output, 'w') as f:
        f.write(code)

    print(f"Generated Aleo program at {args.output}")
