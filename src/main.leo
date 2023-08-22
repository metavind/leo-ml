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

@author: metavind
@date: 21/08/2023
**/
program nn.aleo {
    // Neural Network Multi Layer Model

    // Define the ReLU activation function
    function relu(x: i128) -> i128 {
        if x > 0i128 {
            return x;
        } else {
            return 0i128;
        }
    }

    // Define the arg_max function
    function arg_max(val_1: i128, val_2: i128) -> u8 {
        let max_val: i128 = val_1;
        let max_idx: u8 = 1u8;
        if val_2 > max_val {
            max_val = val_2;
            max_idx = 2u8;
        }
        return max_idx;
    }
    

    // Input struct
    struct Input {
        in1: i128,
        in2: i128,
    }

    // Layer structs
    struct L1 {
        i1_o1: i128,
        i2_o1: i128,
        i1_o2: i128,
        i2_o2: i128,
        i1_o3: i128,
        i2_o3: i128,
        i1_o4: i128,
        i2_o4: i128,
        i1_o5: i128,
        i2_o5: i128,
        i1_o6: i128,
        i2_o6: i128,
        i1_o7: i128,
        i2_o7: i128,
        i1_o8: i128,
        i2_o8: i128,
        i1_o9: i128,
        i2_o9: i128,
        i1_o10: i128,
        i2_o10: i128,
        b1: i128,
        b2: i128,
        b3: i128,
        b4: i128,
        b5: i128,
        b6: i128,
        b7: i128,
        b8: i128,
        b9: i128,
        b10: i128,
    }
    struct L2 {
        i1_o1: i128,
        i2_o1: i128,
        i3_o1: i128,
        i4_o1: i128,
        i5_o1: i128,
        i6_o1: i128,
        i7_o1: i128,
        i8_o1: i128,
        i9_o1: i128,
        i10_o1: i128,
        i1_o2: i128,
        i2_o2: i128,
        i3_o2: i128,
        i4_o2: i128,
        i5_o2: i128,
        i6_o2: i128,
        i7_o2: i128,
        i8_o2: i128,
        i9_o2: i128,
        i10_o2: i128,
        b1: i128,
        b2: i128,
    }

    // Neural Network consisting of multiple layers
    struct NeuralNet {
        l1: L1,
        l2: L2,
    }

    // The main function that takes input and produces an output
    transition compute(data: Input) -> public u8 {

        // Initialize the model
        let model: NeuralNet = NeuralNet {
            l1: L1 {
                i1_o1: -201799i128,
                i2_o1: 253330i128,
                i1_o2: -94632i128,
                i2_o2: -1679517i128,
                i1_o3: -194549i128,
                i2_o3: 139218i128,
                i1_o4: -158168i128,
                i2_o4: 497705i128,
                i1_o5: -566381i128,
                i2_o5: 1437657i128,
                i1_o6: -1098219i128,
                i2_o6: -252057i128,
                i1_o7: -643523i128,
                i2_o7: -291986i128,
                i1_o8: -291486i128,
                i2_o8: 26194i128,
                i1_o9: 1668978i128,
                i2_o9: 576082i128,
                i1_o10: -1310992i128,
                i2_o10: -1006468i128,
                b1: 332004696131i128,
                b2: -615841984749i128,
                b3: -247557893395i128,
                b4: 528358042240i128,
                b5: -533230543137i128,
                b6: -386732697487i128,
                b7: 680972695351i128,
                b8: -655961990356i128,
                b9: -657531619072i128,
                b10: -634221017361i128,
            },
            l2: L2 {
                i1_o1: -167334i128,
                i2_o1: 1135549i128,
                i3_o1: -176126i128,
                i4_o1: -262836i128,
                i5_o1: 915547i128,
                i6_o1: 590526i128,
                i7_o1: -63137i128,
                i8_o1: 271829i128,
                i9_o1: 1246469i128,
                i10_o1: 1245495i128,
                i1_o2: 60699i128,
                i2_o2: -1024452i128,
                i3_o2: 24655i128,
                i4_o2: -177994i128,
                i5_o2: -1364973i128,
                i6_o2: -1049718i128,
                i7_o2: 78062i128,
                i8_o2: 185411i128,
                i9_o2: -1245607i128,
                i10_o2: -1103638i128,
                b1: -94743110239505760i128,
                b2: 611362576484680192i128,
            },
        };

        // Compute the output
        let val_l1_1: i128 = relu(model.l1.i1_o1 * data.in1 + model.l1.i2_o1 * data.in2 + model.l1.b1);
        let val_l1_2: i128 = relu(model.l1.i1_o2 * data.in1 + model.l1.i2_o2 * data.in2 + model.l1.b2);
        let val_l1_3: i128 = relu(model.l1.i1_o3 * data.in1 + model.l1.i2_o3 * data.in2 + model.l1.b3);
        let val_l1_4: i128 = relu(model.l1.i1_o4 * data.in1 + model.l1.i2_o4 * data.in2 + model.l1.b4);
        let val_l1_5: i128 = relu(model.l1.i1_o5 * data.in1 + model.l1.i2_o5 * data.in2 + model.l1.b5);
        let val_l1_6: i128 = relu(model.l1.i1_o6 * data.in1 + model.l1.i2_o6 * data.in2 + model.l1.b6);
        let val_l1_7: i128 = relu(model.l1.i1_o7 * data.in1 + model.l1.i2_o7 * data.in2 + model.l1.b7);
        let val_l1_8: i128 = relu(model.l1.i1_o8 * data.in1 + model.l1.i2_o8 * data.in2 + model.l1.b8);
        let val_l1_9: i128 = relu(model.l1.i1_o9 * data.in1 + model.l1.i2_o9 * data.in2 + model.l1.b9);
        let val_l1_10: i128 = relu(model.l1.i1_o10 * data.in1 + model.l1.i2_o10 * data.in2 + model.l1.b10);
        let val_l2_1: i128 = model.l2.i1_o1 * val_l1_1 + model.l2.i2_o1 * val_l1_2 + model.l2.i3_o1 * val_l1_3 + model.l2.i4_o1 * val_l1_4 + model.l2.i5_o1 * val_l1_5 + model.l2.i6_o1 * val_l1_6 + model.l2.i7_o1 * val_l1_7 + model.l2.i8_o1 * val_l1_8 + model.l2.i9_o1 * val_l1_9 + model.l2.i10_o1 * val_l1_10 + model.l2.b1;
        let val_l2_2: i128 = model.l2.i1_o2 * val_l1_1 + model.l2.i2_o2 * val_l1_2 + model.l2.i3_o2 * val_l1_3 + model.l2.i4_o2 * val_l1_4 + model.l2.i5_o2 * val_l1_5 + model.l2.i6_o2 * val_l1_6 + model.l2.i7_o2 * val_l1_7 + model.l2.i8_o2 * val_l1_8 + model.l2.i9_o2 * val_l1_9 + model.l2.i10_o2 * val_l1_10 + model.l2.b2;
        return arg_max(val_l2_1, val_l2_2) - 1u8;
    }
}