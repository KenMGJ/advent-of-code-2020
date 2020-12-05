//
//  challenge.swift
//  advent-of-code-2020
//
//  Created by Ken Giroux on 12/1/20.
//

import Foundation

protocol Challenge {
    func part1()
    func part2()
}

extension Challenge {
    func inputToIntArray(_ input: String) -> [Int] {
        var arr = [Int]()
        for ipt in input.split(separator: "\n") {
            if let i = Int(String(ipt)) {
                arr.append(i)
            }
        }
        return arr
    }

    func inputToStringArray(_ input: String) -> [String] {

        var lines = [String]()

        input.enumerateLines{ line, _ in
            lines.append(line)
        }
    
        return lines
    }
    
    func inputToCharArrayArray(_ input: String) -> [[Character]] {
        return inputToStringArray(input).map({ Array($0) })
    }
    
    func parseFromRegex(pattern: String, input: String, parts: Int) -> [String] {

        /*
         let input = """
         pos=<0,0,0>, r=4
         pos=<1,0,0>, r=1
         pos=<4,0,0>, r=3
         pos=<0,2,0>, r=1
         pos=<0,5,0>, r=3
         pos=<0,0,3>, r=1
         pos=<1,1,1>, r=1
         pos=<1,1,-2>, r=1
         pos=<-1,3,-1>, r=1
         """
         
         let pattern = #"^pos=<(-?\d+),(-?\d+),(-?\d+)>, r=(\d+)$"#
         for i in inputToStringArray(input) {
             let splits = splitLineWithRegex(pattern: pattern, input: i, parts: 4)
             print("\(splits)")
         }
         */
        
        var output = [String]()
        
        let regex = try? NSRegularExpression(pattern: pattern, options: [])
        let nsrange = NSRange(input.startIndex..., in: input)

        let results = regex?.matches(in: input, options: [], range: nsrange)
        results.map { result in
            if !result.isEmpty {
                let r = result[0]

                for i in 1...parts {
                    if let range = Range(r.range(at: i), in: input) {
                        output.append(String(input[range]))
                    }
                }
            }
        }
        
        return output
    }
}
