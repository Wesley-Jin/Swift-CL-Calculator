//
//  Calculator.swift
//  calc
//
//  Created by Jacktator on 31/3/20.
//  Copyright © 2020 UTS. All rights reserved.
//

import Foundation

class Calculator {

    var currentResult = 0;
    /// Perform Addition
    func add(no1: Int, no2: Int) -> Int {
        return no1 + no2;
    }
    /// Perform Subtraction
    func subtract(no1: Int, no2: Int) -> Int {
        return no1 - no2;
    }
    /// Perform Multiplication
    func multiply(no1: Int, no2: Int) -> Int {
        return no1 * no2;
    }
    /// Perform Division
    func divide (no1: Int, no2: Int) -> Int {
        return no1 / no2;
    }
    /// Perform Modulus
    func modulus (no1: Int, no2: Int) -> Int {
        return no1 % no2;
    }
    
    /// Initialise high priority operators for BODMAS
    let highPriority = ["x", "/", "%"];
    
    func calculate (args: [String]) {
        /// copied args into variable argsArray for replaceSubrange method on line 62
        var argsArray = args;
        /// while args contains an element ($0) that is contained within the highPriority list, loop through the for-loop and if statement
        while (argsArray.contains{highPriority.contains($0)}) {
            /// for all elements i in args array
            for i in argsArray.indices {
                /// if the current element i in args contains any highPriority operator
                if (highPriority.contains(argsArray[i])) {
                    var result: Int = 0;
                    switch argsArray[i] {
                    case "x":
                        /// for x, multiply left number with the right number and save the calculation into the result variable
                        result = multiply(no1: Int(argsArray[i-1]) ?? 0, no2: Int(argsArray[i+1]) ?? 0);
                    case "/":
                        /// for /, divide left number by the right number and save the calculation into the result variable
                        result = divide(no1: Int(argsArray[i-1]) ?? 0, no2: Int(argsArray[i+1]) ?? 0);
                    case "%":
                        /// for %, perform modulus on the left number with the right number and save the calculation into the result variable
                        result = modulus(no1: Int(argsArray[i-1]) ?? 0, no2: Int(argsArray[i+1]) ?? 0);
                    default:
                        break;
                    }
                    /// replace the 3 elements we just performed calculations on with the result variable
                    argsArray.replaceSubrange((i-1)...(i+1), with:[String(result)]);
                    /// breaks out of if-statement after replacing subrange
                    break;
                }
            }
        }
        
        /// since only low priority operators (+, -) are left, we can calculate linearly (left to right) by firstly allowing currentResult equal to the first element (left-most element) in args
        currentResult = Int(argsArray[0]) ?? 0;
        /// for all elements i in args array
        for i in argsArray.indices {
            /// if current element is +, then currentResult adds itself with the right number
            if argsArray[i] == "+" {
                currentResult += Int(argsArray[i+1]) ?? 0;
            }
            /// if current element is -, then currentResult subtracts itself with the right number
            else if argsArray[i] == "-" {
                currentResult -= Int(argsArray[i+1]) ?? 0;
            }
        }
    }
}
    
