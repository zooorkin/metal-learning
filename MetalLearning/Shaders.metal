//
// Shaders.metal
// MetalLearning
//
// Created by zooorkin on 26.11.2022
// Copyright © 2022 zooorkin. All rights reserved.
//

#include <metal_stdlib>
using namespace metal;

vertex float4 basic_vertex(const device packed_float3* vertex_array [[ buffer(0) ]],
                           unsigned int vid [[ vertex_id ]]) {
    float3 current_vertex = vertex_array[vid];
    // Здесь можно сделать преобразование координат вершин (тут оставляем как есть)
    // Например, если нужно повернуть объект или переместить
    // Также, если четвёртую координату заменить на 2, то треугольник станет в два раза меньше
    return float4(current_vertex, 1); // Тут специальный инициализатор float4 = float3 + float1
}

fragment float4 basic_fragment() {
    // Каждый пиксель, который обрабатывается фрагментным шейдером будет жёлтым
    // Здесь, последнее значение alpha пока не работает
    return float4(0.9, 0.8, 0.3, 1);
}
