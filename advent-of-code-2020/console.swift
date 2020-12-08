//
//  console.swift
//  advent-of-code-2020
//
//  Created by Ken Giroux on 12/8/20.
//

import Foundation

class Console {

    enum Operation: String {
        case acc = "acc"
        case jmp = "jmp"
        case nop = "nop"
    }

    class Instruction {
        var op: Operation
        let arg: Int
        
        var visits = 0
        
        init(op: Operation, arg: Int) {
            self.op = op
            self.arg = arg
        }
    }
    
    var accumulator = 0
    var instructions = [Instruction]()
    var ptr = 0
    
    let pattern = #"^(acc|jmp|nop) ([+-]\d+)$"#
    
    init(_ input: [String]) {
        for i in input {
            let parsed = parseFromRegex(pattern: pattern, input: i, parts: 2)
            if let op = Operation(rawValue: parsed[0]), let arg = Int(parsed[1]) {
                instructions.append(Instruction(op: op, arg: arg))
            }
        }
    }
    
    func reset() {
        accumulator = 0
        ptr = 0
        for i in instructions {
            i.visits = 0
        }
    }
    
    func runDay08Part1() {
        reset()
        let result = run(detectInfiniteLoop: true, infiniteLoopThreshold: 2)
        print("\(result.acc)")
    }
    
    func runDay08Part2() {
        for i in 0..<instructions.count {
            reset()
            
            var success = false

            switch instructions[i].op {
            case .acc:
                break
            case .jmp:
                instructions[i].op = .nop
                success = detectLoop()
                instructions[i].op = .jmp
            case .nop:
                instructions[i].op = .jmp
                success = detectLoop()
                instructions[i].op = .nop
            }
            
            if success {
                break
            }
        }
    }
    
    func detectLoop() -> Bool {
        let result = run(detectInfiniteLoop: true, infiniteLoopThreshold: 2)
        if result.success {
            print("\(result.acc)")
        }
        return result.success
    }
    
    func run(detectInfiniteLoop: Bool = false, infiniteLoopThreshold: Int = 2) -> (acc: Int, success: Bool) {
        while ptr < instructions.count {
            let instr = instructions[ptr]

            instr.visits += 1
            
            if detectInfiniteLoop && instr.visits == 2 {
                return (accumulator, false)
            }
            
            switch instr.op {
            case .acc:
                accumulator += instr.arg
            case .jmp:
                ptr += (instr.arg - 1)
            case .nop:
                break
            }
            
            ptr += 1
        }

        return (accumulator, true)
    }
}
