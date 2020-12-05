//
//  day05.swift
//  advent-of-code-2020
//
//  Created by Ken Giroux on 12/4/20.
//

import Foundation

class Day05: Challenge {

    func part1() {

        let ids = getSeatdIds(input_day05)
        if let last = ids.last {
            print("\(last)")
        }
    }
    
    func getSeatdIds(_ input: String) -> [UInt] {
        
        var output = [UInt]()
        
        for arr in inputToCharArrayArray(input) {
            
            var row: UInt = 0
            var col: UInt = 0

            var last = 6
            for i in 0...last {
                row = row | ((arr[i] == "B" ? 1 : 0) << (last - i))
            }
            
            last = arr.count - 1
            for i in 7...last {
                col = col | ((arr[i] == "R" ? 1 : 0) << (last - i))
            }
            
            output.append(row * 8 + col)
        }
        
        output.sort()
        return output
    }
    
    func part2() {
        let ids = getSeatdIds(input_day05)
        for i in 0..<ids.count-1 {
            if ids[i+1] - ids[i] == 2 {
                print("\(ids[i]+1)")
                break
            }
        }
    }

}
