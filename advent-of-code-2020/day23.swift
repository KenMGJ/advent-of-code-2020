//
//  day23.swift
//  advent-of-code-2020
//
//  Created by Ken Giroux on 12/22/20.
//

import Foundation

class Cup: Equatable {
    let label: Int
    var next: Cup?

    init(label: Int) {
        self.label = label
    }

    static func == (lhs: Cup, rhs: Cup) -> Bool {
        return lhs.label == rhs.label
    }
}

class Day23: Challenge {

    func part1() {
        let input = charArrayToIntArray(inputToCharArrayArray(input_day23)[0])
        // print(input)

        let maxVal = input.reduce(0, {(a,b) in max(a,b) })

        var (current, _) = createCupCircle(input)
        current = play(current, maxVal: maxVal, rounds: 100)

        let val = solvePart1(current)
        print(val)
    }

    func buildDict(_ current: Cup) -> Dictionary<Int, Cup> {
        var current = current

        var dict = Dictionary<Int, Cup>()
        while dict[current.label] == nil {
            dict[current.label] = current
            current = current.next!
        }

        return dict
    }

    func play(_ current: Cup, maxVal: Int, rounds: Int) -> Cup {
        var current = current

        let dict = buildDict(current)

        var move = 0
        while move < rounds {
            move += 1

            let a1 = current.next!
            let a2 = a1.next!
            let a3 = a2.next!
            var dest = a3.next!

            // print("\(a1.label) \(a1.next!.label) \(a3.label)")

            current.next = dest

            var lookFor = current.label - 1
            while lookFor == a1.label || lookFor == a2.label || lookFor == a3.label || lookFor <= 0 {
                lookFor -= 1
                if lookFor <= 0 {
                    lookFor = maxVal
                }
            }

            dest = dict[lookFor]!

            a3.next = dest.next
            dest.next = a1
            current = current.next!
        }

        return current
    }

    func findCup(_ destination: Cup, value: Int) -> Cup? {
        let d = destination

        var current = destination
        repeat {
            if current.label == value {
                return current
            }

            current = destination.next!
        } while current != d

        return nil
    }

    func solvePart1(_ current: Cup) -> String {
        var current = current
        while current.label != 1 {
            current = current.next!
        }
        current = current.next!

        var val = ""
        while current.label != 1 {
            val += String(current.label)
            current = current.next!
        }
        return val
    }

    func printCups(_ current: Cup, times: Int) {
        var current = current
        for _ in 0..<times {
            print(current.label, terminator: " ")
            current = current.next!
        }
        print()
    }

    func createCupCircle(_ input: [Int]) -> (first: Cup, one: Cup) {
        var input = input
        let firstLabel = input.removeFirst()

        let first = Cup(label: firstLabel)
        var current = first

        var one: Cup? = nil

        var next: Cup? = nil
        for i in input {
            next = Cup(label: i)
            current.next = next
            current = next!

            if i == 1 {
                one = current
            }
        }

        if let n = next {
            n.next = first
        }

        return (first, one!)
    }

    func part2() {

        var input = charArrayToIntArray(inputToCharArrayArray(input_day23)[0])

        let newMax = 1000000

        var maxVal = input.reduce(0, {(a,b) in max(a,b) })

        for i in maxVal+1...newMax {
            input.append(i)
        }
        maxVal = newMax

        let (current, one) = createCupCircle(input)
        let _ = play(current, maxVal: maxVal, rounds: 10000000)

        let val = one.next!.label * one.next!.next!.label
        print(val)
    }
}
