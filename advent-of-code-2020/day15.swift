//
//  day15.swift
//  advent-of-code-2020
//
//  Created by Ken Giroux on 12/14/20.
//

import Foundation

class Day15: Challenge {

    func part1() {
        run(input: input_day15, times: 2020)
    }

    func run(input: String, times: Int) {

        let startingNumbers = input.split(separator: ",")

        var lasts = Dictionary<Int, Int>()
        var last = 0

        var turn = 0

        for s in startingNumbers {
            turn += 1

            if let n = Int(s) {
                lasts[n] = turn
                last = n
            }
        }
        lasts[last] = nil

        while turn < times {
            turn += 1

            if let l = lasts[last] {
                lasts[last] = turn - 1
                last = turn - 1 - l
            } else {
                lasts[last] = turn - 1
                last = 0
            }
        }

        print("\(last)")
    }

    func part2() {
        run(input: input_day15, times: 30000000)
    }

}
