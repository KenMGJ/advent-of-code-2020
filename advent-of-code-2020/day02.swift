//
//  day02.swift
//  advent-of-code-2020
//
//  Created by Ken Giroux on 12/1/20.
//

import Foundation

class Day02: Challenge {
    
    func part1() {

        var validCount = 0
        
        for line in inputToStringArray(input_day02) {

            let pattern = #"^(\d+)-(\d+) (.): (.+)$"#
            let parts = parseFromRegex(pattern: pattern, input: line, parts: 4)

            if let min = Int(parts[0]) {
                if let max = Int(parts[1]) {
                    let char = parts[2]
                    let password = parts[3]
                    
                    var count = 0
                    for c in password {
                        if String(c) == char {
                            count += 1
                        }
                    }

                    if min <= count && count <= max {
                        validCount += 1
                    }
                }
            }
        }
        
        print("\(validCount)")
    }
    
    func part2() {
        
        var validCount = 0
        
        for line in inputToStringArray(input_day02) {

            let pattern = #"^(\d+)-(\d+) (.): (.+)$"#
            let parts = parseFromRegex(pattern: pattern, input: line, parts: 4)

            if let pos1 = Int(parts[0]) {
                if let pos2 = Int(parts[1]) {
                    let char = parts[2]
                    let password = parts[3]
                    
                    let c1 = String(password[password.index(password.startIndex, offsetBy: pos1-1)])
                    let c2 = String(password[password.index(password.startIndex, offsetBy: pos2-1)])
     
                    if (c1 == char && c2 != char) || (c1 != char && c2 == char) {
                        validCount += 1
                    }
                }
            }
        }
        
        print("\(validCount)")
    }
}
