//
//  day13.swift
//  advent-of-code-2020
//
//  Created by Ken Giroux on 12/12/20.
//

import Foundation

class Day13: Challenge {

    func part1() {
        let input = inputToStringArray(input_day13)

        if let arrival = Int(input[0]) {
            let busIds = input[1].split(separator: ",").filter({ $0 != "x" })
                .compactMap({ Int($0) })

            let busArrivals = busIds.map({ arrival - (arrival % $0) + $0 })

            if let min = busArrivals.min() {
                if let idx = busArrivals.firstIndex(where: { $0 == min }) {

                    let result = busIds[idx] * (min - arrival)
                    print("\(result)")
                }
            }
        }
    }

    func part2() {
        let input = inputToStringArray(input_day13)

        let buses: [Int] = input[1].split(separator: ",").map({
            if let i = Int($0) {
                return i
            } else {
                return 0
            }
        })

        var a = [Int]()
        var n = [Int]()

        for (idx, bus) in buses.enumerated() {
            if bus != 0 {
                a.append(-1 * idx)
                n.append(bus)
            }
        }
        print("Use to calculate: https://www.dcode.fr/chinese-remainder")
        print("\(a) \(n)")
    }

}
