package main

import (
	"fmt"
	"math/rand"
)

// FUNCION QUE HACE ARREGLOS DE SIZE TAMAÑO DE FLOAT64
func vectorOfZeros(size int) []float64 {
	x := make([]float64, size)
	return x
}

func vectorOfZerosInt(size int) []int {
	x := make([]int, size)
	return x
}

// FUNCION QUE HACE ARREGLOS DE SIZE TAMAÑO DE FLOAT64 aleatorios
func vectorOfRandoms(size int) []float64 {
	x := make([]float64, size)
	for i := range x {
		x[i] = rand.Float64()
	}
	return x
}

func vectorOfRandomsInt(size int) []int {
	x := make([]int, size)
	for i := range x {
		x[i] = rand.Int() / 100000000000000000
	}
	return x
}

func squareMatrix(size int) [][]int {
	a := make([][]int, size)
	for i := range a {
		a[i] = make([]int, size)
	}
	return a
}

func squareRandomMatrix(size int) [][]int {
	x := squareMatrix(size)
	for i := range x {
		for j := range x {
			x[i][j] = rand.Int() / 100000000000000000
		}
	}
	return x
}

func vectorPorMatrix(size int) []int {
	vector := vectorOfRandomsInt(size)
	matrix := squareRandomMatrix(size)
	resultado := vectorOfZerosInt(size)
	fmt.Println("La matriz a multiplicar es:  ", matrix)
	fmt.Println("El vector a multiplicar es:  ", vector)
	for i := range matrix {
		acc := 0
		row := matrix[i]
		for j := range row {
			acc += row[j] * vector[j]
		}
		resultado[i] = acc
	}
	return resultado
}

func sistemaDeEcuaciones() {

}

func main() {
	fmt.Println(vectorOfZeros(10))
	fmt.Println(vectorOfRandoms(10))
	fmt.Println(squareMatrix(2))
	fmt.Println(squareRandomMatrix(10))
	fmt.Println(vectorPorMatrix(4))
}
