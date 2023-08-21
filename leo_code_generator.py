import argparse


# def generate_nn_code(input_dim, hidden_dims, output_dim):
#     indentation = "    "
#     hidden_neurons = hidden_dims[0]

#     # Hidden Layer weights and biases
#     hidden_weights = "\n".join(
#         [f"{indentation*2}l1_i{i+1}_o{j+1}: i32," for i in range(input_dim) for j in range(hidden_neurons)])
#     hidden_biases = "\n".join(
#         [f"{indentation*2}l1_b{j+1}: i32," for j in range(hidden_neurons)])

#     # Output Layer weights and biases
#     output_weights = "\n".join(
#         [f"{indentation*2}lo_i{j+1}_o{k+1}: i32," for k in range(output_dim) for j in range(hidden_neurons)])
#     output_biases = "\n".join(
#         [f"{indentation*2}lo_b{k+1}: i32," for k in range(output_dim)])

#     # Computation for the hidden layer
#     hidden_computation = "\n".join(
#         [f"{indentation*2}let val_l1_{j+1}: i32 = relu(" +
#          " + ".join([f'model.l1.l1_i{i+1}_o{j+1} * input{i+1}' for i in range(input_dim)]) +
#          f" + model.l1.l1_b{j+1});" for j in range(hidden_neurons)])

#     # Computation for the output layer
#     output_computation = "\n".join(
#         [f"{indentation*2}let val_o_{k+1}: i32 = relu(" +
#          " + ".join([f'model.o.lo_i{j+1}_o{k+1} * val_l1_{j+1}' for j in range(hidden_neurons)]) +
#          f" + model.o.lo_b{k+1});" for k in range(output_dim)])

#     # Argmax computation for output
#     conditions = "\n".join(
#         [f"{indentation*2}if val_o_{i+1} > max_val {{\n{indentation*3}max_val = val_o_{i+1};\n{indentation*3}max_idx = {i+1}u8;\n{indentation*2}}}" for i in range(output_dim)])

#     arg_max_function = f"""
#     function arg_max({', '.join([f'val_o_{i+1}: i32' for i in range(output_dim)])}) -> u8 {{
# {indentation*2}let max_val: i32 = val_o_1;
# {indentation*2}let max_idx: u8 = 1u8;
# {conditions}
# {indentation*2}return max_idx;
#     }}
#     """

#     # Composing the final Aleo code
#     code = f"""program nn.aleo {{
#     // Neural Network Single Layer Model

#     // Define the ReLU activation function
#     function relu(x: i32) -> i32 {{
#         if x > 0i32 {{
#             return x;
#         }} else {{
#             return 0i32;
#         }}
#     }}

#     {arg_max_function}

#     // Hidden Layer weights and biases
#     struct L1 {{
# {hidden_weights}
# {hidden_biases}
#     }}

#     // Output Layer weights and biases
#     struct O {{
# {output_weights}
# {output_biases}
#     }}

#     // Neural Network consisting of Hidden and Output Layers
#     struct NeuralNet {{
#         l1: L1,
#         o: O,
#     }}

#     // The main function that takes input and produces an output
#     transition compute({', '.join([f'input{i+1}: i32' for i in range(input_dim)])}, model: NeuralNet) -> u8 {{
# {hidden_computation}
# {output_computation}
#         return arg_max({', '.join([f'val_o_{i+1}' for i in range(output_dim)])});
#     }}
# }}"""

#     return code

def generate_nn_code(input_dim, hidden_dims, output_dim):
    indentation = "    "

    # Layer 1 (L1) weights and biases
    l1_neurons = hidden_dims[0]
    l1_weights = "\n".join(
        [f"{indentation*2}l1_i{i+1}_o{j+1}: i32," for i in range(input_dim) for j in range(l1_neurons)])
    l1_biases = "\n".join(
        [f"{indentation*2}l1_b{j+1}: i32," for j in range(l1_neurons)])

    # Output Layer (LO) weights and biases
    lo_weights = "\n".join(
        [f"{indentation*2}lo_i{j+1}_o{k+1}: i32," for k in range(output_dim) for j in range(l1_neurons)])
    lo_biases = "\n".join(
        [f"{indentation*2}lo_b{k+1}: i32," for k in range(output_dim)])

    # Computation for the Layer 1 (L1)
    l1_computation = "\n".join(
        [f"{indentation*2}let val_l1_{j+1}: i32 = relu(" +
         " + ".join([f'model.l1.l1_i{i+1}_o{j+1} * input{i+1}' for i in range(input_dim)]) +
         f" + model.l1.l1_b{j+1});" for j in range(l1_neurons)])

    # Computation for the output layer (LO)
    lo_computation = "\n".join(
        [f"{indentation*2}let val_o_{k+1}: i32 = relu(" +
         " + ".join([f'model.o.lo_i{j+1}_o{k+1} * val_l1_{j+1}' for j in range(l1_neurons)]) +
         f" + model.o.lo_b{k+1});" for k in range(output_dim)])

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
    code = f"""program nn.aleo {{
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

    // Layer 1 weights and biases
    struct L1 {{
{l1_weights}
{l1_biases}
    }}

    // Output Layer weights and biases
    struct O {{
{lo_weights}
{lo_biases}
    }}

    // Neural Network consisting of L1 and Output Layers
    struct NeuralNet {{
        l1: L1,
        o: O,
    }}

    // The main function that takes input and produces an output
    transition compute({', '.join([f'input{i+1}: i32' for i in range(input_dim)])}, model: NeuralNet) -> u8 {{
{l1_computation}
{lo_computation}
        return arg_max({', '.join([f'val_o_{i+1}' for i in range(output_dim)])});
    }}
}}"""

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
