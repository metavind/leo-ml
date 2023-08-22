"""
Script Generator for Aleo Program Testing

This script provides a utility to generate a bash test script for Aleo programs. The generated test script
will run the Aleo program with different input values specified in a JSON file and print both the actual
and expected output values.

The JSON file should have the following structure:
{
    "input1": [input_values1],
    "output1": expected_output1,
    "input2": [input_values2],
    "output2": expected_output2,
    ...
}

Inputs:
    - A JSON file containing the test samples. The JSON should have keys of the form 
      'inputX' and 'outputX', where X is the sample number (starting from 1).

Outputs:
    Generates a bash script named `test_<program_name>.sh`. This script can be executed
    to run the tests on the specified Aleo program.

Usage:
    Run the script and provide the necessary command-line arguments:
    --program_name: The name of the Aleo program to be tested.
    --test_samples: Path to the JSON file containing the test samples (input-output pairs).

Example:
    python leo_test_generator.py --program_name nn --test_samples test_samples.json
"""

import argparse
import json
import os


def generate_script(program_name, test_samples_file):
    # Read test_samples json file
    with open(test_samples_file, 'r') as f:
        test_data = json.load(f)

    file_name = f"test_{program_name}.sh"

    file_header = """#!/bin/bash\n"""

    with open(file_name, 'w') as f:
        f.write(file_header)

        idx = 1
        while f"input{idx}" in test_data and f"output{idx}" in test_data:
            f.write(f'\necho "Test {idx}"')

            sample = test_data[f"input{idx}"]
            sample_dim = len(sample)

            input_string = ', '.join(
                [f'in{j+1}: {sample[j]}i128' for j in range(sample_dim)])
            expected_value = f"{test_data[f'output{idx}']}u8"

            command = f'''
leo run -q compute "{{ {input_string} }}" | awk -F"• " '/u8/ {{print "Actual Value   : "$2}}'
echo "Expected Value : {expected_value}\n"\n'''
            f.write(command)
            idx += 1

    # Make the script executable
    os.chmod(file_name, 0o755)


if __name__ == "__main__":
    parser = argparse.ArgumentParser(
        description="Generate a bash script to test the Aleo program.")
    parser.add_argument("--program_name", required=True,
                        help="Name of the Aleo program.")
    parser.add_argument("--test_samples", required=True,
                        help="Path to the JSON file with test samples.")
    args = parser.parse_args()

    generate_script(args.program_name, args.test_samples)

    print(f"Generated test script: test_{args.program_name}.sh")
