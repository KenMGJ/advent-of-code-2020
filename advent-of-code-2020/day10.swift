//
//  day10.swift
//  advent-of-code-2020
//
//  Created by Ken Giroux on 12/9/20.
//

import Foundation

class Day10: Challenge {

    func part1() {

        var adapters = inputToIntArray(input_day10)
        adapters.sort()

        adapters.insert(0, at: 0)
        adapters.append(adapters[adapters.count-1] + 3)

        var ones = 0
        var threes = 0

        for i in 1..<adapters.count {
            switch adapters[i] - adapters[i-1] {
            case 1:
                ones += 1
            case 3:
                threes += 1
            default:
                break
            }
        }

        print("\(ones * threes)")
    }

    func part2() {

        var adapters = inputToIntArray(input_day10)
        adapters.sort()

        let outlet = 0
        adapters.insert(outlet, at: 0)

        let device = adapters[adapters.count-1] + 3
        adapters.append(device)

        self.adapters = adapters
        print("\(countArrangements(0))")
    }

    var adapters = [Int]()
    var cache = Dictionary<Int, Int>()

    func countArrangements(_ idx: Int) -> Int {
        if let c = cache[idx] {
            return c
        }
        if idx == adapters.count - 1 {
            return 1
        }

        var count = 0

        for i in 1...3 {
            let idx_i = idx + i
            if idx_i < adapters.count {
                if adapters[idx_i] - adapters[idx] <= 3 {
                    count += countArrangements(idx_i)
                }
            }
        }

        cache[idx] = count
        return count
    }
}
