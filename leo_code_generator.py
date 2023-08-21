"""
Neural Network Code Generator for Aleo

Description:
    This script provides functionality to automatically generate Aleo code
    for representing and computing neural network models. The generated Aleo
    code will include data structures for the neural network's weights and biases,
    as well as the necessary logic to compute forward passes through the network.

Inputs:
    - A JSON file containing the neural network's weights and biases. The JSON
      should have keys of the form 'lX_weights' and 'lX_biases', where X is
      the layer number (starting from 1).

Outputs:
    - An Aleo source code file (`.leo`) that represents the given neural network
      and provides a `compute` transition function that takes input data and
      produces an output.

Usage:
    Run the script and provide the necessary command-line arguments:
    --model_data: Path to the input JSON file containing model data.
    --output: Path to the output Aleo code file (default is "src/main.leo").
    --program_name: Name of the Aleo program.

Example:
    python leo_code_generator.py --model_data model.json --program_name nn

How the Code is Generated:
    1. The script first parses the JSON input to determine the structure of
       the neural network, including the number of layers and their sizes.
    2. For each layer in the model, the script generates a corresponding
       Aleo struct to represent the weights and biases.
    3. The script generates the `compute` transition function in Aleo that
       performs the forward pass computation using the weights and biases
       defined in the structs.
    4. The output of the neural network is computed using the ReLU activation
       function for all layers except the output layer.
    5. Finally, the code computes the `arg_max` of the output layer to determine
       the index of the maximum value, which serves as the network's prediction.
       (this is zero-indexed, so the final output is subtracted by 1)

"""

import argparse
import json


def generate_documentation_header(author="metavind", creation_date="21/08/2023"):
    """
    Generate the documentation header for the Aleo Neural Network program.

    Parameters:
    - author (str): Name of the author.
    - creation_date (str): Date of creation.

    Returns:
    - str: Documentation header for the Aleo program.
    """

    header = f"""
/**
Neural Network Implementation in Aleo
======================================

Purpose:
--------
This script defines a neural network model and its forward pass computation in Aleo's programming language.

Inputs:
-------
- Input: A struct containing two integer values representing the input values to the network.

Outputs:
--------
- An unsigned 8-bit integer representing the index of the maximum value from the output layer. 
    We consider a classification problem, so the index of the maximum value is the network's prediction.

How the Code is Generated:
--------------------------
1. The script first defines helper functions like the relu activation function and the arg_max function.
2. It then defines the input structure and layer structures for the neural network.
3. The NeuralNet struct represents the complete neural network model consisting of the defined layers.
4. The transition `compute` function represents the forward pass of the neural network. It computes the result for each layer using weights, biases, and the relu activation function.
5. Finally, the code computes the `arg_max` of the output layer to determine the index of the maximum value, which serves as the network's prediction.

Note:
-----
The weights and biases embedded within the script are sample values for classification task on circle dataset and should be replaced with the actual trained values for other use cases.

@author: {author}
@date: {creation_date}
**/
"""
    return header.strip()


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
    arg_max_function = f"""function arg_max({', '.join([f'val_{i+1}: i128' for i in range(output_dim)])}) -> u8 {{
{indentation*2}let max_val: i128 = val_1;
{indentation*2}let max_idx: u8 = 1u8;
{conditions}
{indentation*2}return max_idx;
    }}
    """

    # Composing the final Aleo code
    code = """\nprogram {program_name}.aleo {{
    // Neural Network Multi Layer Model

    // Define the ReLU activation function
    function relu(x: i128) -> i128 {{
        if x > 0i128 {{
            return x;
        }} else {{
            return 0i128;
        }}
    }}

    // Define the arg_max function
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

        // Initialize the model
{model_initialization}

        // Compute the output
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

    documentation = generate_documentation_header()
    code = generate_nn_code(args.program_name, model_data)

    with open(args.output, 'w') as f:
        f.write(documentation)
        f.write(code)

    print(f"Generated Aleo program at {args.output}")
