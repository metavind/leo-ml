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
            f.write(f'echo "Test {idx}"\n')

            sample = test_data[f"input{idx}"]
            sample_dim = len(sample)

            input_string = ', '.join(
                [f'in{j+1}: {sample[j]}i128' for j in range(sample_dim)])
            expected_value = f"{test_data[f'output{idx}']}u8"

            command = f'''
leo run -q compute "{{ {input_string} }}" | awk -F"• " '/u8/ {{print "Actual Value   : "$2}}'
echo "Expected Value : {expected_value}\n"
            '''
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
