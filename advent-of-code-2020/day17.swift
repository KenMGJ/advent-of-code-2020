//
//  day17.swift
//  advent-of-code-2020
//
//  Created by Ken Giroux on 12/16/20.
//

import Foundation

struct Coordinates {
    let x: Int
    let y: Int
    let z: Int
}

extension Coordinates: Equatable, Hashable {

    static func ==(lhs: Coordinates, rhs: Coordinates) -> Bool {
        return lhs.x == rhs.x && lhs.y == rhs.y && lhs.z == rhs.z
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(x)
        hasher.combine(y)
        hasher.combine(z)
    }
}

struct Coordinates4D {
    let x: Int
    let y: Int
    let z: Int
    let w: Int
}

extension Coordinates4D: Equatable, Hashable {

    static func ==(lhs: Coordinates4D, rhs: Coordinates4D) -> Bool {
        return lhs.x == rhs.x && lhs.y == rhs.y && lhs.z == rhs.z && lhs.w == rhs.w
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(x)
        hasher.combine(y)
        hasher.combine(z)
        hasher.combine(w)
    }
}

class Day17: Challenge {

    func part1() {
        run(input_day17, cycles: 6, debug: false)
    }

    func run(_ input: String, cycles: Int, debug: Bool) {
        let input = inputToCharArrayArray(input)

        var state = Dictionary<Coordinates, Bool>()
        var i = input.count / -2
        for y in 0..<input.count {
            let row = input[y]
            var j = row.count / -2
            for x in 0..<row.count {
                state[Coordinates(x: j, y: i, z: 0)] = row[x] == "#" ? true : false
                j += 1
            }
            i += 1
        }

        var cycle = 0
        var width = i
        if debug {
            printState(state, cycle: cycle, width: width)
        }

        while cycle < cycles {
            cycle += 1
            width += 1

            var newState = Dictionary<Coordinates, Bool>()

            for z in (-1 * cycle)...(cycle) {
                for y in (-1 * width)...width {
                    for x in (-1 * width)...width {
                        let coordinates = Coordinates(x: x, y: y, z: z)
                        var active = false
                        if let cube = state[coordinates] {
                            active = cube
                        }

                        var nextState = false

                        let activeNeighbors = countActiveNeighbors(state, cube: coordinates)
                        if active {
                            if activeNeighbors == 2 || activeNeighbors == 3 {
                                nextState = true
                            }
                        } else {
                            if activeNeighbors == 3 {
                                nextState = true
                            }
                        }

                        newState[coordinates] = nextState
                    }
                }
            }

            state = newState
            if debug {
                printState(state, cycle: cycle, width: width)
            }
        }

        let activeCount = state.reduce(0, { x, y in x + ( y.value ? 1 : 0 ) })
        print(activeCount)
    }

    func printState(_ state: Dictionary<Coordinates, Bool>, cycle: Int, width: Int) {
        for z in (-1 * cycle)...(cycle) {
            print("z=\(z)")
            for y in (-1 * width)...width {
                var line = ""
                for x in (-1 * width)...width {
                    if let active = state[Coordinates(x: x, y: y, z: z)] {
                        line.append(active ? "#" : ".")
                    }
                }
                print(line)
            }
            print()
        }
    }

    func countActiveNeighbors(_ state: Dictionary<Coordinates, Bool>, cube: Coordinates) -> Int {
        var count = 0
        for x in (cube.x - 1)...(cube.x + 1) {
            for y in (cube.y - 1)...(cube.y + 1) {
                for z in (cube.z - 1)...(cube.z + 1) {
                    let neighbor = Coordinates(x: x, y: y, z: z)
                    if cube != neighbor {
                        if let n = state[neighbor] {
                            if n {
                                count += 1
                            }
                        }
                    }
                }
            }
        }
        return count
    }

    func part2() {
        run4d(input_day17, cycles: 6, debug: false)
    }

    func run4d(_ input: String, cycles: Int, debug: Bool) {
        let input = inputToCharArrayArray(input)

        var state = Dictionary<Coordinates4D, Bool>()
        var i = input.count / -2
        for y in 0..<input.count {
            let row = input[y]
            var j = row.count / -2
            for x in 0..<row.count {
                state[Coordinates4D(x: j, y: i, z: 0, w: 0)] = row[x] == "#" ? true : false
                j += 1
            }
            i += 1
        }

        var cycle = 0
        var width = i
        if debug {
            // printState(state, cycle: cycle, width: width)
        }

        while cycle < cycles {
            cycle += 1
            width += 1

            var newState = Dictionary<Coordinates4D, Bool>()

            for w in (-1 * cycle)...(cycle) {
                for z in (-1 * cycle)...(cycle) {
                    for y in (-1 * width)...width {
                        for x in (-1 * width)...width {
                            let coordinates = Coordinates4D(x: x, y: y, z: z, w: w)
                            var active = false
                            if let cube = state[coordinates] {
                                active = cube
                            }

                            var nextState = false

                            let activeNeighbors = countActiveNeighbors4D(state, cube: coordinates)
                            if active {
                                if activeNeighbors == 2 || activeNeighbors == 3 {
                                    nextState = true
                                }
                            } else {
                                if activeNeighbors == 3 {
                                    nextState = true
                                }
                            }

                            newState[coordinates] = nextState
                        }
                    }
                }
            }

            state = newState
            if debug {
                // printState(state, cycle: cycle, width: width)
            }
        }

        let activeCount = state.reduce(0, { x, y in x + ( y.value ? 1 : 0 ) })
        print(activeCount)
    }

    func countActiveNeighbors4D(_ state: Dictionary<Coordinates4D, Bool>, cube: Coordinates4D) -> Int {
        var count = 0
        for x in (cube.x - 1)...(cube.x + 1) {
            for y in (cube.y - 1)...(cube.y + 1) {
                for z in (cube.z - 1)...(cube.z + 1) {
                    for w in (cube.w - 1)...(cube.w + 1) {
                        let neighbor = Coordinates4D(x: x, y: y, z: z, w: w)
                        if cube != neighbor {
                            if let n = state[neighbor] {
                                if n {
                                    count += 1
                                }
                            }
                        }
                    }
                }
            }
        }
        return count
    }
}
