//
// ColoredShaders.metal
// MetalLearning
//
// Created by zooorkin on 26.11.2022
// Copyright © 2022 zooorkin. All rights reserved.
//

#include <metal_stdlib>

using namespace metal;

// Include header shared between this Metal shader code and C code executing Metal API commands.
#include "ColoredShaders.h"

// Vertex shader outputs and fragment shader inputs
struct RasterizerData
{
    // Значения коордиант после преобразования фрагментным шейдером
    float4 position [[position]];

    // Если у этого свойства нет специального атрибута, растеризатор интерполирует его значение
    // (приблизит, вычислит сам) по значениям соседних вершин и передаст полученное значение во фрагментный шейдер
    // для каждого фрагмента (пикселя в примитиве, здесь, в треугольнике)
    //
    // Если указать атрибут [[flat]], то интерполяция пропадёт
    float4 color;
};

// Просим чтобы в первом параметре был ID текущей вершины через указание атрибута [[vertex_id]]
// А во втором – буфер, переданный под индексом 0
// (В определении шейдера параметры можно поменять местами)
vertex RasterizerData vertex_shader(uint vertexID [[vertex_id]],
                                    constant VertexInput *vertices [[buffer(0)]],
                                    constant vector_uint2 *viewportSizePointer [[buffer(1)]])
{
    VertexInput current_vertex = vertices[vertexID];
   
    RasterizerData out;

    // Перевод из координат экрана в коордианты View Port через векторные операции (поэлементные)
    vector_float2 position = current_vertex.position / (float2)*viewportSizePointer * 2;
    out.position = float4(position, 0, 1);

    // Передача входного цвета напрямую растеризатору
    out.color = current_vertex.color;

    return out;
}

fragment float4 fragment_shader(RasterizerData input [[stage_in]])
{
    // Возвращает интерполированный растеризатором цвет
    return input.color;
}
