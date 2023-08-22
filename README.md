# Neural Networks in Leo

This repository provides a framework for creating aleo programs for inference on multi-layer feedforward networks.

As an example, we deploy an aleo program comprising a neural network with one hidden layer and one output layer and demonstrate it for the problem of binary classification on circles dataset.

## Quickstart

Please make sure you have leo installed. If not, follow the instructions [here](https://developer.aleo.org/leo/installation).

To run the binary classsification neural network example, follow these steps:

```sh
# Clone the repository
git clone https://github.com/metavind/leo-ml.git
cd leo-ml

# Run the leo program
leo run compute

# Run the leo program on a custom input
leo run compute "{ in1: 966399i128, in2: 359227i128 }"

# Run the test script
./test_nn.sh
```

## Generating Aleo program from a custom trained neural network

Run the following command to generate Aleo program using the parameters of a custom trained neural network:

```sh
python leo_program_generator.py --program_name <desired_program_name> --model_parameters <path_to_model_parameters>
```

The above command will generate the Aleo program in `src/main.leo`, create an appropriate `program.json` file, and also create an input template file for the program in `inputs/<desired_program_name>.in`.

In the input file, fill the custom input data that you would like the model to run on. The model can then be run using the following command:

```sh
leo run compute
```

Alternatively, you can use the following command directly to run the model on a specific input:

```sh
leo run compute "{ in1: <input_1>, in2: <input_2>, ... , inn: <input_n> } }"
```

Here, *in1*, *in2*, ..., *inn* are the input variables of the model which takes an input of dimension *n*. They must be appropriately suffixed with *i128*.

Note: The model_parameters file should be a JSON containing the neural network's weights and biases. The JSON should have keys of the form *l\{idx}_weights* and *l\{idx}_biases*, where *idx* is the layer number (starting from 1). The value of each key should be a flattened list of the weights/biases of the corresponding layer. For example, the following JSON is a valid model_parameters file for a neural network with 2 hidden layers and 1 output layer. It has an input dimension of 3, and an output dimension of 1.

```json
{
    "l1_weights": [0.1, 0.2, 0.3, 0.4, 0.5, 0.6],
    "l1_biases": [0.1, 0.2],
    "l2_weights": [0.1, 0.2, 0.3, 0.4],
    "l2_biases": [0.1, 0.2],
    "l3_weights": [0.1, 0.2],
    "l3_biases": [0.1]
}
```

## Testing the generated Aleo program on custom test samples

Run the following command to generate a test script for the generated Aleo program on custom test samples:

```sh
python leo_program_generator.py --program_name <program_name> --test_samples <path_to_test_samples>
```

The above command will generate a test script `<program_name>.sh` which can be run using the following command:

```sh
./test_<program_name>.sh
```

The test script will run the generated Aleo program on each test sample and print the output of the Aleo program, along with the expected output from the neural network.

Note: The test_samples file should be a JSON containing the test samples. The JSON should have keys of the form *input{idx}* and *output{idx}*, where *idx* is the index of the test sample (starting from 1). The value of each key should be a list of the input/output of the corresponding test sample. For example, the following JSON is a valid test_samples file for a neural network defined by the parameters in the above example.

```json
{
    "input1": [0.1, 0.2, 0.3],
    "output1": 1,
    "input2": [0.4, 0.5, 0.6],
    "output2": 0
}
```
