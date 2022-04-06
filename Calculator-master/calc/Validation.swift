//
//  Validation.swift
//  calc
//
//  Created by Wesley Jin on 20/3/2022.
//  Copyright © 2022 UTS. All rights reserved.
//

import Foundation

class Validation {
    var operators = ["+", "-", "x", "/", "%"];

    /// array count must be odd to ensure that input does not end with an operator
    func checkEvenArray(args: [String]) {
        if (args.count % 2 == 0) {
            exit(1);
        }
    }
    
    /// for every element in args, check if the current element is greater or less than boundary values, and check if the final result from the calculations also exceeds the boundary values, if any of these values do exceed the boundaries, then exit
        func checkOutOfBounds(args: [String]) {
        for i in args.indices {
            if ((Int(args[i]) ?? 0 > Int.max) || (Int(args[i]) ?? 0 < Int.min) || (calculator.currentResult > Int.max) || (calculator.currentResult < Int.min)) {
                exit(1)
            }
        }
    }
    
    /// check every even arg element is an integer and every odd arg element is an operator, if not, then exit
    func checkIntAndOps(args: [String]) {
        /// stride check for even elements (integers)
        for i in stride(from: 0, to: args.count, by: 2) {
            if(Int(args[i]) == nil) {
                exit(1);
            }
        }
        /// stride check for odd elements (operators)
        for i in stride(from: 1, to: args.count-1, by: 2) {
            if(!(operators.contains(args[i]))) {
                exit(1);
            }
        }
    }
}
