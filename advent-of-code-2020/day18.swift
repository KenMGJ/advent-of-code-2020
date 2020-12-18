//
//  day18.swift
//  advent-of-code-2020
//
//  Created by Ken Giroux on 12/17/20.
//

import Foundation

class Day18: Challenge {

    typealias Calculator = (_: inout [Int], _: inout [Character]) -> Int

    func part1() {
        let input = inputToStringArray(input_day18)

        var sum = 0
        for line in input {
            let collapsed = line.replacingOccurrences(of: " ", with: "")
            sum += calculate(collapsed, calculator: leftToRight)
        }
        print(sum)
    }

    func calculate(_ input: String, calculator: Calculator) -> Int {
        var inCopy = input
        // print(inCopy)

        while inCopy.contains("(") {
            // print(inCopy)

            if let rp = inCopy.firstIndex(of: ")") {
                var expr = inCopy.prefix(upTo: rp)
                if let lp = expr.lastIndex(of: "(") {
                    let range = lp...rp
                    expr = inCopy[range]

                    let val = calculateValue(String(expr), calculator: calculator)
                    // print(val)

                    let rpPlus1 = inCopy.index(rp, offsetBy: 1)
                    inCopy = String(inCopy[inCopy.startIndex..<lp]) + String(val) + String(inCopy[rpPlus1...])
                    // print(inCopy)
                }
            }
        }

        return calculateValue(inCopy, calculator: calculator)
    }

    func calculateValue(_ input: String, calculator: Calculator) -> Int {
        var input = input.replacingOccurrences(of: "(", with: "").replacingOccurrences(of: ")", with: "")
        // print(input)

        var nums = [Int]()
        var ops = [Character]()

        while input.contains("+") || input.contains("*") {
            let idxPlus = input.firstIndex(of: "+")
            let idxMult = input.firstIndex(of: "*")

            var selectedIdx: String.Index = input.startIndex
            if let p = idxPlus {
                selectedIdx = p
            }

            if let m = idxMult {
                if idxPlus == nil {
                    selectedIdx = m
                    ops.append("*")
                } else if let p = idxPlus {
                    if m < p {
                        selectedIdx = m
                        ops.append("*")
                    } else {
                        ops.append("+")
                    }
                }
            } else {
                ops.append("+")
            }

            let num = input[input.startIndex..<selectedIdx]
            if let n = Int(num) {
                nums.append(n)
            }

            let nextIdx = input.index(selectedIdx, offsetBy: 1)
            input = String(input[nextIdx...])
        }

        if input.count > 0 {
            if let i = Int(input) {
                nums.append(i)
            }
        }

        return calculator(&nums, &ops)
    }

    func leftToRight(nums: inout [Int], ops: inout [Character]) -> Int {
        while !ops.isEmpty {
            let a = nums.removeFirst()
            let b = nums.removeFirst()

            let op = ops.removeFirst()

            if op == "+" {
                nums.insert(a + b, at: 0)
            } else {
                nums.insert(a * b, at: 0)
            }
        }

        return nums[0]
    }

    func addThenMultiply(nums: inout [Int], ops: inout [Character]) -> Int {

        while ops.contains("+") {
            if let i = ops.firstIndex(of: "+") {
                ops.remove(at: i)

                let a = nums.remove(at: i)
                let b = nums.remove(at: i)
                nums.insert(a + b, at: i)
            }
        }

        while !ops.isEmpty {
            let a = nums.removeFirst()
            let b = nums.removeFirst()

            let op = ops.removeFirst()
            if op == "*" {
                nums.insert(a * b, at: 0)
            }
        }

        return nums[0]
    }

    func part2() {
        let input = inputToStringArray(input_day18)

        var sum = 0
        for line in input {
            let collapsed = line.replacingOccurrences(of: " ", with: "")
            sum += calculate(collapsed, calculator: addThenMultiply)
        }
        print(sum)
    }
}
