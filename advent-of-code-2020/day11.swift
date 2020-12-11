//
//  day11.swift
//  advent-of-code-2020
//
//  Created by Ken Giroux on 12/10/20.
//

import Foundation

class Day11: Challenge {

    var seats = [[Character]]()
    var next = [[Character]]()

    func part1() {

        seats = inputToCharArrayArray(input_day11)

        var generations = 0
        var stable = false

        while !stable {
            stable = runSimulation(countMethod: occupiedNeighborCount, limit: 4)
            generations += 1
        }

        print("\(countOccupiedSeats())")
    }

    typealias OccupiedMethod = (Int, Int) -> Int

    func runSimulation(countMethod: OccupiedMethod, limit: Int) -> Bool {

        next = [[Character]]()

        for i in 0..<seats.count {
            let row = seats[i]
            var nextRow = [Character]()
            for j in 0..<row.count {

                switch row[j] {
                case "L":
                    nextRow.append(countMethod(i, j) == 0 ? "#" : "L")
                case "#":
                    nextRow.append(countMethod(i, j) >= limit ? "L" : "#")
                default:
                    nextRow.append(".")
                    break
                }

            }
            next.append(nextRow)
        }

        let stable = isStable()
        seats = next
        return stable
    }

    func occupiedNeighborCount(y: Int, x: Int) -> Int {
        var count = 0

        for i in y-1...y+1 {
            if i < 0 || i == seats.count {
                continue
            }

            let row = seats[i]

            for j in x-1...x+1 {
                if i == y && j == x {
                    continue
                }

                if j < 0 || j == row.count {
                    continue
                }

                if row[j] == "#" {
                    count += 1
                }
            }
        }

        return count
    }

    func isStable() -> Bool {
        for i in 0..<seats.count {
            let rowSeats = seats[i]
            let rowNext = next[i]
            for j in 0..<rowSeats.count {
                if rowSeats[j] != rowNext[j] {
                    return false
                }
            }
        }
        return true
    }

    func countOccupiedSeats() -> Int {
        var count = 0
        for row in seats {
            for col in row {
                if col == "#" {
                    count += 1
                }
            }
        }
        return count
    }

    func part2() {
        seats = inputToCharArrayArray(input_day11)

        var generations = 0
        var stable = false

        while !stable {
            stable = runSimulation(countMethod: partTwoNeighborCount, limit: 5)
            generations += 1
            // printSeats()
        }

        print("\(countOccupiedSeats())")
    }

    let directions = [[-1,-1],[-1,0],[-1,1],[0,-1],[0,1],[1,-1],[1,0],[1,1]]

    func partTwoNeighborCount(y: Int, x: Int) -> Int {
        var count = 0

        let minY = 0
        let maxY = seats.count

        let minX = 0
        let maxX = seats[0].count

        for direction in directions {
            var i = y + direction[0]
            var j = x + direction[1]

            while i >= minY && i < maxY && j >= minX && j < maxX {
                let seat = seats[i][j]
                if seat == "#" {
                    count += 1
                    break
                } else if seat == "L" {
                    break
                }

                i += direction[0]
                j += direction[1]
            }
        }

        return count
    }

    func printSeats() {
        for row in seats {
            for col in row {
                print(col, terminator: "")
            }
            print()
        }
        print()
    }
}
