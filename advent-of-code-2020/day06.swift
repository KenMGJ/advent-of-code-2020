//
//  day06.swift
//  advent-of-code-2020
//
//  Created by Ken Giroux on 12/5/20.
//

import Foundation

class Day06: Challenge {
    
    func part1() {
        
        var answers = inputToCharArrayArray(input_day06)
        if let a = answers.last {
            if !a.isEmpty {
                answers.append([])
            }
        }
        
        var counts = [Int]()
        var group = Set<Character>()
        
        for a in answers {
            if a.count == 0 {
                counts.append(group.count)
                group = Set<Character>()
                continue
            }
            
            for c in a {
                group.insert(c)
            }
        }
        
        let sum = counts.reduce(0, { a, b in a + b })
        print("\(sum)")
    }
    
    func part2() {
        var answers = inputToCharArrayArray(input_day06)
        if let a = answers.last {
            if !a.isEmpty {
                answers.append([])
            }
        }

        struct entry {
            var size: Int
            var q: Dictionary<Character, Int>
        }
        
        var groups = [entry]()
        var group = entry(size: 0, q: Dictionary<Character, Int>())
        
        for a in answers {
            if a.count == 0 {
                groups.append(group)
                group = entry(size: 0, q: Dictionary<Character, Int>())
                continue
            }

            for char in a {

                if let c = group.q[char] {
                    group.q[char] = c + 1
                } else {
                    group.q[char] = 1
                }
            }
            group.size += 1
        }

        let sum = groups.reduce(0, { a, b in a + b.q.reduce(0, { c, d in c + ( d.value == b.size ? 1 : 0 ) })})
        print("\(sum)")
    }

}
