//
// ColoredShaders.h
// MetalLearning
//
// Created by zooorkin on 26.11.2022
// Copyright © 2022 zooorkin. All rights reserved.
//

#ifndef ColoredShaders_h
#define ColoredShaders_h

#include <simd/simd.h>

// Для видимости в Swift-коде. Чтобы совпадало выраванивание
//
// Эта структура определяет выравнивание вершин, посылаемых вершинному шейдеру
// Заголовочный файл между .swift и .metal кодом гарантирует, что выравнивание
// массива с вершинами в Swift совпадёт с выравниванием, которое ожидает вершинный шейдер
typedef struct
{
    vector_float2 position;
    vector_float4 color;
} VertexInput;

#endif /* ColoredShaders_h */
