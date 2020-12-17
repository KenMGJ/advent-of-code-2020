//
//  day16.swift
//  advent-of-code-2020
//
//  Created by Ken Giroux on 12/15/20.
//

import Foundation

class Day16: Challenge {

    struct Range {
        let lowMin: Int
        let lowMax: Int
        let highMin: Int
        let highMax: Int
    }

    var rules = [Range]()
    var ruleOrder = [String]()

    var myTicket = [Int]()
    var otherTickets = [[Int]]()

    var pattern = #"^(.*): (\d+)-(\d+) or (\d+)-(\d+)$"#

    func part1() {
        parseInput(input_day16)

        var errorRate = 0
        for o in otherTickets {
            for v in o {
                if !matchesAtLeastOneRule(v) {
                    errorRate += v
                }
            }
        }

        print("\(errorRate)")
    }

    func matchesAtLeastOneRule(_ val: Int) -> Bool {
        for rule in rules {
            if matchesRule(val, rule: rule) {
                return true
            }
        }
        return false
    }

    func matchesRule(_ val: Int, rule: Range) -> Bool {
        return (val >= rule.lowMin && val <= rule.lowMax) || (val >= rule.highMin && val <= rule.highMax)
    }

    func parseInput(_ input: String) {

        rules = [Range]()
        ruleOrder = [String]()
        myTicket = [Int]()
        otherTickets = [[Int]]()

        var lines = inputToStringArray(input)

        var line = lines.removeFirst()
        while line != "" {

            let parsed = parseFromRegex(pattern: pattern, input: line, parts: 5)
            if let lmin = Int(parsed[1]), let lmax = Int(parsed[2]), let hmin = Int(parsed[3]), let hmax = Int(parsed[4]) {
                rules.append(Range(lowMin: lmin, lowMax: lmax, highMin: hmin, highMax: hmax))
                ruleOrder.append(parsed[0])
            }

            line = lines.removeFirst()
        }

        // skip my ticket line
        line = lines.removeFirst()
        // my ticket data
        line = lines.removeFirst()

        myTicket = splitLine(line)

        // skip blank line
        line = lines.removeFirst()
        // skip nearby tickets line
        line = lines.removeFirst()

        for line in lines {
            otherTickets.append(splitLine(line))
        }
    }

    func splitLine(_ line: String) -> [Int] {

        var intVals = [Int]()

        let vals = line.split(separator: ",")
        var i = 0
        for v in vals {
            if let n = Int(v) {
                intVals.append(n)
            }
            i += 1
        }

        return intVals
    }

    func part2() {
        parseInput(input_day16)

        var validTickets = [[Int]]()
        validTickets.append(myTicket)

        for o in otherTickets {

            var matchesAllRules = true
            for v in o {
                if !matchesAtLeastOneRule(v) {
                    matchesAllRules = false
                    break
                }
            }

            if matchesAllRules {
                validTickets.append(o)
            }
        }
        // print("\(validTickets)")

        var ruleVals = [[Int]]()
        for i in 0..<myTicket.count {
            var ruleVal = [Int]()
            for v in validTickets {
                ruleVal.append(v[i])
            }
            ruleVals.append(ruleVal)
        }
        // print(ruleVals)

        var ruleValsMatch = [[Int]]()
        for ruleVal in ruleVals {
            var ruleMatchSet = [Int]()
            for i in 0..<rules.count {
                if allMatch(ruleVal, rules[i]) {
                    ruleMatchSet.append(i)
                }
            }
            ruleMatchSet.sort()
            ruleValsMatch.append(ruleMatchSet)
        }
        // print("\(ruleValsMatch)")

        var rulePositions = Array(repeating: 0, count: rules.count)
        var added = 0
        var curr = -1

        while added < rules.count {

            var i = 0
            for rvm in ruleValsMatch {
                if rvm.count == 1 {
                    if let c = rvm.first {
                        curr = c
                        rulePositions[i] = c
                        added += 1
                        break
                    }
                }
                i += 1
            }

            i = 0
            for var rvm in ruleValsMatch {
                rvm.removeAll(where: { $0 == curr })
                ruleValsMatch[i] = rvm
                i += 1
            }
        }
        // print(rulePositions)

        var rulePosNames = [String]()
        for r in rulePositions {
            rulePosNames.append(ruleOrder[r])
        }
        // print(rulePosNames)

        var product = 1
        for i in 0..<rulePosNames.count {
            let name = rulePosNames[i]
            if name.hasPrefix("departure") {
                product *= myTicket[i]
            }
        }
        print(product)
    }

    func allMatch(_ vals: [Int], _ rule: Range) -> Bool {
        for v in vals {
            if !matchesRule(v, rule: rule) {
                return false
            }
        }
        return true
    }

}
