//
//  day07.swift
//  advent-of-code-2020
//
//  Created by Ken Giroux on 12/6/20.
//

import Foundation

class Day07: Challenge {

    let pattern = #"^(.* .*) bags contain (.*)$"#
    let patternLast = #"^ ?(\d+)? (.* .*) bags?.?"#

    var bags = Dictionary<String, Dictionary<String, Int>>()

    func part1() {
        bags = parseBags(input_day07)

        let myBag = "shiny gold"

        var count = 0

        for bag in bags {
            if bag.key != myBag {
                if canContain(bag: bag.key, myBag: myBag) {
                    count += 1
                }
            }
        }

        print("\(count)")
    }

    func canContain(bag: String, myBag: String) -> Bool {
        if let found = bags[bag] {
            for b in found {
                if b.key == myBag {
                    return true
                } else {
                    if canContain(bag: b.key, myBag: myBag) {
                        return true
                    }
                }
            }
        }
        return false
    }

    func parseBags(_ input: String) -> Dictionary<String, Dictionary<String, Int>> {

        var bags = Dictionary<String, Dictionary<String, Int>>()

        for i in inputToStringArray(input) {
            let bag = parseBag(i)
            bags[bag.style] = bag.contents
        }

        return bags
    }

    func parseBag(_ input: String) -> (style: String, contents: Dictionary<String, Int>) {

        var contents = Dictionary<String, Int>()

        let parts = parseFromRegex(pattern: pattern, input: input, parts: 2)
        let style = parts[0]

        let contentParts = parts[1].split(separator: ",")
        for part in contentParts {
            let parsedParts = parseFromRegex(pattern: patternLast, input: String(part), parts: 2)

            if !parsedParts.isEmpty {
                if let count = Int(parsedParts[0]) {
                    contents[parsedParts[1]] = count
                }
            }
        }

        return (style, contents)
    }

    func part2() {
        bags = parseBags(input_day07)

        let myBag = "shiny gold"

        let count = countBags(bag: myBag)
        print("\(count)")
    }

    func countBags(bag: String) -> Int {

        // print("\(bag)")
        var count = 0

        if let found = bags[bag] {
            for b in found {
                let val = b.value
                // print("\(val)")
                count += val
                let cnt = val * countBags(bag: b.key)
                // print("\(cnt)")
                count += cnt
            }
        }

        return count
    }

}
