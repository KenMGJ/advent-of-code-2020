//
//  day14.swift
//  advent-of-code-2020
//
//  Created by Ken Giroux on 12/14/20.
//

import Foundation

class Day14: Challenge {

    let patternForMask = #"^mask = ((X|0|1){36})$"#
    let patternForInstruction = #"mem\[(\d+)\] = (\d+)"#

    func part1() {
        let input = inputToStringArray(input_day14)

        var mem = Dictionary<Int, UInt64>()
        var andMask = UInt64.max
        var orMask = UInt64.min

        for line in input {

            let maskArr = parseFromRegex(pattern: patternForMask, input: line, parts: 1)
            if !maskArr.isEmpty {
                let mask = Array(maskArr[0])

                andMask = UInt64.max
                orMask = UInt64.min

                // print("\(andMask) \(orMask)")
                for i in (0..<mask.count).reversed() {
                    let power = mask.count - i - 1
                    if mask[i] == "0" {
                        andMask -= UInt64(pow(Double(2), Double(power)))
                    }
                    if mask[i] == "1" {
                        orMask += UInt64(pow(Double(2), Double(power)))
                    }
                }
                // print("\(andMask) \(orMask)")
            } else {
                let instr = parseFromRegex(pattern: patternForInstruction, input: line, parts: 2)
                    if let loc = Int(instr[0]) {
                        if let val = UInt64(instr[1]) {
                            mem[loc] = val & andMask | orMask
                    }
                }
            }
        }

        // print("\(mem)")
        var sum: UInt64 = 0
        for (_, v) in mem.enumerated() {
            sum += v.value
        }
        print("\(sum)")
    }

    func part2() {
        let input = inputToStringArray(input_day14)

        var mem = Dictionary<UInt, UInt64>()
        var mask = ""

        for line in input {

            let maskArr = parseFromRegex(pattern: patternForMask, input: line, parts: 1)
            if !maskArr.isEmpty {
                mask = maskArr[0]
            } else {
                let instr = parseFromRegex(pattern: patternForInstruction, input: line, parts: 2)
                    if let loc = UInt64(instr[0]) {
                        if let val = UInt64(instr[1]) {
                            for m in makeMasks(mask: mask, mem: loc) {
                                let i = strtoul(m, nil, 2)
                                mem[i] = val
                            }
                    }
                }
            }
        }

        // print("\(mem)")
        var sum: UInt64 = 0
        for (_, v) in mem.enumerated() {
            sum += v.value
        }
        print("\(sum)")
    }

    func makeMasks(mask: String, mem: UInt64) -> [String] {

        var newMask = ""

        let maskArr = Array(mask)
        for i in (0..<maskArr.count) {
            let power = maskArr.count - i - 1

            switch maskArr[i] {
            case "0":
                let base: UInt64 = 1
                let str = mem & (base << power) == 0 ? "0" : "1"
                newMask.append(String(str))
            case "1":
                newMask.append("1")
            case "X":
                newMask.append("X")
            default:
                break
            }
        }

        let masks = newMaskToMasks(newMask)
        return masks
    }

    func newMaskToMasks(_ mask: String) -> [String] {
        if mask.count == 0 {
            return [""]
        }

        var mask = mask
        let first = mask.removeFirst()

        var masks = [String]()

        if first == "0" || first == "1" {
            for m in newMaskToMasks(mask) {
                let s = String(first) + m
                masks.append(s)
            }
        } else if first == "X" {
            for m in newMaskToMasks(mask) {
                masks.append("0" + m)
                masks.append("1" + m)
            }
        }

        return masks
    }
}
