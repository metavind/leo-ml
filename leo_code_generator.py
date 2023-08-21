import argparse


def generate_nn_code(input_dim, hidden_dims, output_dim):
    indentation = "    "

    # Helper function to generate layer weights and biases
    def generate_layer_struct(layer_idx, input_size, output_size):
        weights = "\n".join(
            [f"{indentation*2}l{layer_idx}_i{i+1}_o{j+1}: i32," for i in range(
                input_size) for j in range(output_size)]
        )
        biases = "\n".join(
            [f"{indentation*2}l{layer_idx}_b{j+1}: i32," for j in range(
                output_size)]
        )
        return f"{indentation}struct L{layer_idx} {{\n{weights}\n{biases}\n{indentation}}}"

    # Helper function to generate layer computation
    def generate_layer_computation(layer_idx, input_size, output_size, prev_layer_idx=None):
        if prev_layer_idx:
            inputs = [
                f"val_l{prev_layer_idx}_{i+1}" for i in range(input_size)]
        else:
            inputs = [f"input{i+1}" for i in range(input_size)]

        computation = "\n".join(
            [f"{indentation*2}let val_l{layer_idx}_{j+1}: i32 = relu(" +
             " + ".join([f'model.l{layer_idx}.l{layer_idx}_i{i+1}_o{j+1} * {inputs[i]}' for i in range(input_size)]) +
             f" + model.l{layer_idx}.l{layer_idx}_b{j+1});" for j in range(output_size)]
        )
        return computation

    # Generate all hidden layer structs and computations
    layer_structs = []
    layer_computations = []
    prev_layer_size = input_dim
    for idx, layer_size in enumerate(hidden_dims, start=1):
        layer_structs.append(generate_layer_struct(
            idx, prev_layer_size, layer_size))
        layer_computations.append(generate_layer_computation(
            idx, prev_layer_size, layer_size, idx-1 if idx > 1 else None))
        prev_layer_size = layer_size

    # Generate output layer structs and computations
    layer_structs.append(generate_layer_struct(
        'o', prev_layer_size, output_dim))
    layer_computations.append(generate_layer_computation(
        'o', prev_layer_size, output_dim, len(hidden_dims)))

    # Argmax computation for output
    conditions = "\n".join(
        [f"{indentation*2}if val_{i+1} > max_val {{\n{indentation*3}max_val = val_{i+1};\n{indentation*3}max_idx = {i+1}u8;\n{indentation*2}}}" for i in range(output_dim)])

    arg_max_function = f"""
    function arg_max({', '.join([f'val_{i+1}: i32' for i in range(output_dim)])}) -> u8 {{
{indentation*2}let max_val: i32 = val_1;
{indentation*2}let max_idx: u8 = 1u8;
{conditions}
{indentation*2}return max_idx;
    }}
    """

    # Composing the final Aleo code
    code = """program nn.aleo {{
    // Neural Network Multi Layer Model

    // Define the ReLU activation function
    function relu(x: i32) -> i32 {{
        if x > 0i32 {{
            return x;
        }} else {{
            return 0i32;
        }}
    }}

    {arg_max_function}

    // Layer structs
{layer_structs_text}

    // Neural Network consisting of multiple layers
    struct NeuralNet {{
{layers_list},
        lo: Lo,
    }}

    // The main function that takes input and produces an output
    transition compute(model: NeuralNet, {input_list}) -> u8 {{
{layer_computations_text}
        return arg_max({output_val_list});
    }}
}}""".format(
        arg_max_function=arg_max_function,
        layer_structs_text="\n".join(layer_structs),
        layers_list=',\n'.join(
            [f'{indentation*2}l{idx}: L{idx}' for idx in range(1, len(hidden_dims) + 1)]),
        input_list=', '.join([f'input{i+1}: i32' for i in range(input_dim)]),
        layer_computations_text="\n".join(layer_computations),
        output_val_list=', '.join([f'val_lo_{i+1}' for i in range(output_dim)])
    )

    return code


if __name__ == "__main__":
    parser = argparse.ArgumentParser(
        description="Generate Aleo code for a single layer neural network.")
    parser.add_argument('--input_dim', type=int,
                        help="The dimension of the input.")
    parser.add_argument("--hidden_dims", nargs='*', type=int,
                        help="Dimensions of each hidden layer, separated by spaces. For example: 10 10 for two hidden layers with 10 neurons each.")
    parser.add_argument('--output_dim', type=int,
                        help="The dimension of the output.")
    parser.add_argument('--output_file', type=str, default="main.leo",
                        help="The file to write the Aleo code to.")

    args = parser.parse_args()

    aleo_code = generate_nn_code(
        args.input_dim, args.hidden_dims, args.output_dim)

    with open(args.output_file, 'w') as f:
        f.write(aleo_code)

    print(f"Written to {args.output_file}")
