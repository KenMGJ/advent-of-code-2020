//
//  day19.swift
//  advent-of-code-2020
//
//  Created by Ken Giroux on 12/18/20.
//

import Foundation

class Day19: Challenge {

    func part1() {
        let input = inputToStringArray(input_day19)
        // print(input)

        let (pattern, idx) = parseRules(input)
        printTotalMatches(pattern: pattern, index: idx, input: input)
    }

    func printTotalMatches(pattern: String, index: Int, input: [String]) {
        var total = 0
        for i in index..<input.count {
            let line = input[i]
            if matchesRegex(pattern: pattern, input: line) {
                total += 1
            }
        }
        print(total)
    }

    let rulePattern = #"^(\d+): (.*)$"#
    var rules = Dictionary<Int, String>()

    func parseRules(_ input: [String]) -> (pat: String, idx: Int) {

        rules = Dictionary<Int, String>()

        var i = 0
        var line = input[i]

        while line != "" {
            let parsedLine = parseFromRegex(pattern: rulePattern, input: line, parts: 2)
            if let r = Int(parsedLine[0]) {
                rules[r] = parsedLine[1]
            }

            i += 1
            line = input[i]
        }

        let rgex = "^" + generateRegex(0) + "$"
        return (pat: rgex, idx: i)
    }

    let valPattern = #"^\"(.)\"$"#

    func generateRegex(_ rule: Int) -> String {
        var val = ""
        if let r = rules[rule] {
            let vals = parseFromRegex(pattern: valPattern, input: r, parts: 1)
            if !vals.isEmpty {
                val = vals[0]
            } else {
                val += "("
                for s in r.split(separator: " ") {
                    if s == "|" {
                        val += "|"
                    } else {
                        if let i = Int(s) {
                            val += generateRegex(i)
                        }
                    }
                }
                val += ")"
            }
        }

        return val
    }

    func part2() {
        let input = inputToStringArray(input_day19)
        // print(input)

        let (_, idx) = parseRules(input)

        let patternRule8 = "^" + generateRegex(8) + "+"

        let patternRule42 = generateRegex(42)
        let patternRule31 = generateRegex(31)

        var total = 0
        for i in idx..<input.count {
            let line = input[i]
            var pattern = patternRule8
            var j = 0
            while j < 10 {
                pattern = patternRule8 + generatePattern(pattern42: patternRule42, pattern31: patternRule31, itr: j)
                if matchesRegex(pattern: pattern, input: line) {
                    total += 1
                    break
                }
                j += 1
            }
        }
        print(total)
    }

    func generatePattern(pattern42: String, pattern31: String, itr: Int) -> String {
        var p42 = pattern42
        var p31 = pattern31

        var i = 0
        while i < itr {
            p42 += pattern42
            p31 += pattern31
            i += 1
        }

        let pattern = p42 + p31 + "$"
        return pattern
    }
}
