//
//  day01.swift
//  advent-of-code-2020
//
//  Created by Ken Giroux on 12/1/20.
//

import Foundation

class Day01: Challenge {
        
    func part1() {
        
        let entries = inputToIntArray(input_day01)

        for i in 0..<(entries.count-1) {
            for j in i+1..<entries.count {
                let x = entries[i]
                let y = entries[j]
                if x + y == 2020 {
                    print("\(x * y)")
                }
            }
        }
    }
    
    func part2() {
        
        let entries = inputToIntArray(input_day01)

        for i in 0..<(entries.count-2) {
            for j in i+1..<(entries.count-1) {
                for k in j+1..<entries.count {
                    let x = entries[i]
                    let y = entries[j]
                    let z = entries[k]
                    if x + y + z == 2020 {
                        print("\(x * y * z)")
                    }
                }
            }
        }
        
    }
}
