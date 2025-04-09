//
// InsertSort.swift
//
// Created by Noah Smith
// Created on 2025-04-09
// Version 1.0
// Copyright (c) 2025 Noah Smith. All rights reserved.
//
// The Insertion Sort program will read a set of integers between 0 and 100.
// It will populate the set of integers into an array.
// It will then sort the arrays using the insertion sort algorithm.
// It will write the sorted array to the output file.

// Import foundation library
import Foundation

// Declare constants
let arrayLength = 10
let minValue = 0
let maxValue = 100

// Function to generate an array of random numbers
func populatingArrays() -> [Int] {

    // Initialize the array
    // Source: https://www.tutorialspoint.com/swift/swift_arrays.htm
    var arrayNum: [Int] = Array(repeating: 0, count: arrayLength)

    // Generate random numbers between 0 and 100
    // Until the counter reaches the end of the array
    for counter in 0..<arrayLength {
        // This line generates a random integer between 0 and 100
        // There are 3 dots instead of 2 because it includes the last number
        arrayNum[counter] = Int.random(in: minValue...maxValue)
    }

    // Return the array
    return arrayNum
}

// Function to sort the array using insertion sort
func insertSort(arrayInt: [Int]) -> [Int] {

    // Create a copy of the array in order to not modify the original
    var arrayInt = arrayInt

    // Sort the array using insertion sort algorithm
    // Source: https://www.programiz.com/dsa/insertion-sort
    // Loop through the array starting from the second element
    for pass in 0..<arrayLength - 1 {

        // store the current number
        let currentNum = arrayInt[pass]

        // Initialize a counter
        var counter = pass - 1

        // Compare key with each element on the left of it
        // until an element smaller than it is found.
        while counter >= 0 && currentNum < arrayInt[counter] {

            // Shift the larger number one position to the left
            arrayInt[counter + 1] = arrayInt[counter]

            // Decrement counter
            counter -= 1
        }

        // Shift the current number one position to the left
        arrayInt[counter + 1] = currentNum
    }

    // return sorted array
    return arrayInt
}

// Greeting
print("Welcome to the insertion sort program!")

// Get the unsorted array by calling the populatingArrays function
var arrayNum = populatingArrays()

// Get the sorted array by calling the bubbleSort function
arrayNum = insertSort(arrayInt: arrayNum)

// Initialize the output string
var outputStr = ""

// Iterate through the sorted array
for num in arrayNum {
    // Add each number to the output string, separated by a space
    outputStr += "\(num) "
}

// Add a new line for spacing
outputStr += "\n"

// Define the output file path
let filePath = "./output.txt"

// Write to the output file
do {
    // Attempt to write the output string to the file
    try outputStr.write(toFile: filePath, atomically: true, encoding: .utf8)

    // Display a blank line for spacing and a success message
    print("\nSuccessfully wrote to 'output.txt'")
} catch {
    // Display error message
    print("Error writing to file: \(error)")
}
