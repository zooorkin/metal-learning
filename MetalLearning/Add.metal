//
// Add.metal
// MetalLearning
//
// Created by zooorkin on 27.11.2022
// Copyright © 2022 zooorkin. All rights reserved.
//

#include <metal_stdlib>
using namespace metal;

kernel void add_arrays(device const float* A,
                       device const float* B,
                       device float* C,
                       uint index [[thread_position_in_grid]])
{
    C[index] = A[index] + B[index];
}
