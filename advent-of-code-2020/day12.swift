//
//  day12.swift
//  advent-of-code-2020
//
//  Created by Ken Giroux on 12/11/20.
//

import Foundation

class Day12: Challenge {

    let pattern = #"^(N|E|S|W|L|R|F)(\d+)$"#

    func part1() {

        let input = inputToStringArray(input_day12)

        var dir = "E"
        var x = 0
        var y = 0

        for i in input {
            let line = parseFromRegex(pattern: pattern, input: i, parts: 2)

            switch line[0] {
            case "N", "E", "S", "W", "F":
                let moveDir = line[0] == "F" ? dir : line[0]
                if let dist = Int(line[1]) {
                    switch moveDir {
                    case "N":
                        y += dist
                    case "E":
                        x += dist
                    case "S":
                        y -= dist
                    case "W":
                        x -= dist
                    default:
                        break
                    }
                }


            case "L":
                if let deg = Int(line[1]) {
                    switch deg {
                    case 90:
                        switch dir {
                        case "N":
                            dir = "W"
                        case "E":
                            dir = "N"
                        case "S":
                            dir = "E"
                        case "W":
                            dir = "S"
                        default:
                            break
                        }
                    case 180:
                        switch dir {
                        case "N":
                            dir = "S"
                        case "E":
                            dir = "W"
                        case "S":
                            dir = "N"
                        case "W":
                            dir = "E"
                        default:
                            break
                        }
                    case 270:
                        switch dir {
                        case "N":
                            dir = "E"
                        case "E":
                            dir = "S"
                        case "S":
                            dir = "W"
                        case "W":
                            dir = "N"
                        default:
                            break
                        }
                    default:
                        break
                    }
                }

            case "R":
                if let deg = Int(line[1]) {
                    switch deg {
                    case 90:
                        switch dir {
                        case "N":
                            dir = "E"
                        case "E":
                            dir = "S"
                        case "S":
                            dir = "W"
                        case "W":
                            dir = "N"
                        default:
                            break
                        }
                    case 180:
                        switch dir {
                        case "N":
                            dir = "S"
                        case "E":
                            dir = "W"
                        case "S":
                            dir = "N"
                        case "W":
                            dir = "E"
                        default:
                            break
                        }
                    case 270:
                        switch dir {
                        case "N":
                            dir = "W"
                        case "E":
                            dir = "N"
                        case "S":
                            dir = "E"
                        case "W":
                            dir = "S"
                        default:
                            break
                        }
                    default:
                        break
                    }
                }

            default:
                break
            }
        }

        print("\(abs(x) + abs(y))")
    }

    func part2() {

        let input = inputToStringArray(input_day12)

        var shipX = 0
        var shipY = 0

        var wayX = 10
        var wayY = 1

        for i in input {
            let line = parseFromRegex(pattern: pattern, input: i, parts: 2)

            switch line[0] {
            case "N", "E", "S", "W":
                if let dist = Int(line[1]) {
                    switch line[0] {
                    case "N":
                        wayY += dist
                    case "E":
                        wayX += dist
                    case "S":
                        wayY -= dist
                    case "W":
                        wayX -= dist
                    default:
                        break
                    }
                }

            case "F":
                if let mult = Int(line[1]) {
                    shipX += mult * wayX
                    shipY += mult * wayY
                }

            case "L":
                if let deg = Int(line[1]) {
                    switch deg {
                    case 90:
                        let wY = wayY
                        wayY = wayX
                        wayX = -1 * wY
                    case 180:
                        wayX = -1 * wayX
                        wayY = -1 * wayY
                    case 270:
                        let wX = wayX
                        wayX = wayY
                        wayY = -1 * wX
                    default:
                        break
                    }
                }

            case "R":
                if let deg = Int(line[1]) {
                    switch deg {
                    case 90:
                        let wX = wayX
                        wayX = wayY
                        wayY = -1 * wX
                    case 180:
                        wayX = -1 * wayX
                        wayY = -1 * wayY
                    case 270:
                        let wY = wayY
                        wayY = wayX
                        wayX = -1 * wY
                    default:
                        break
                    }
                }

            default:
                break
            }
        }

        // 46768
        print("\(abs(shipX) + abs(shipY))")
    }

}
