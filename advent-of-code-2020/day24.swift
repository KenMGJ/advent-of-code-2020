//
//  day24.swift
//  advent-of-code-2020
//
//  Created by Ken Giroux on 12/23/20.
//

import Foundation

enum HexDirection {
    case e
    case se
    case sw
    case w
    case nw
    case ne

    func opposite() -> HexDirection {
        switch self {
        case .e:
            return .w
        case .se:
            return .nw
        case .sw:
            return .ne
        case .w:
            return .e
        case .nw:
            return .se
        case .ne:
            return .sw
        }
    }
}

enum HexTileColor {
    case white
    case black
}

struct HexTile: Equatable, Hashable {
    let x: Int
    let y: Int

    static func == (lhs: HexTile, rhs: HexTile) -> Bool {
        return lhs.x == rhs.x && lhs.y == rhs.y
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(x)
        hasher.combine(y)
    }
}

class Day24: Challenge {

    func part1() {
        let input = inputToCharArrayArray(input_day24)
        let paths = parseInput(input)

        flipTiles(paths)
    }

    var origin = HexTile(x: 0, y: 0)
    var tiles = Dictionary<HexTile, HexTileColor>()

    var xmin = 0
    var xmax = 0
    var ymin = 0
    var ymax = 0

    func flipTiles(_ paths: [[HexDirection]]) {

        origin = HexTile(x: 0, y: 0)

        tiles = Dictionary<HexTile, HexTileColor>()
        tiles[origin] = .white

        for path in paths {
            flipTile(path)
        }

        let count = tiles.reduce(0, {(a,b) in a + (b.value == .black ? 1 : 0) })
        print(count)
    }

    func flipTile(_ path: [HexDirection]) {

        var current = origin

        for p in path {
            var x = current.x
            var y = current.y

            switch p {
            case .e:
                x += 1
            case .se:
                y += 1
            case .sw:
                x -= 1
                y += 1
            case .w:
                x -= 1
            case .nw:
                y -= 1
            case .ne:
                x += 1
                y -= 1
            }

            current = HexTile(x: x, y: y)
            if tiles[current] == nil {
                tiles[current] = .white
                setMinAndMax(current)
            }
        }

        if let c = tiles[current] {
            tiles[current] = c == .white ? .black : .white
        }
    }

    func setMinAndMax(_ t: HexTile) {
        if t.x < xmin {
            xmin = t.x
        }
        if t.x > xmax {
            xmax = t.x
        }
        if t.y < ymin {
            ymin = t.y
        }
        if t.y > ymax {
            ymax = t.y
        }
    }

    func parseInput(_ input: [[Character]]) -> [[HexDirection]] {

        var directions = [[HexDirection]]()

        for line in input {

            var dir = [HexDirection]()

            var i = 0
            while i < line.count {
                switch line[i] {
                case "e":
                    dir.append(.e)
                case "w":
                    dir.append(.w)
                default:
                    if line[i] == "s" {
                        if line[i+1] == "e" {
                            dir.append(.se)
                        } else {
                            dir.append(.sw)
                        }
                    } else {
                        if line[i+1] == "e" {
                            dir.append(.ne)
                        } else {
                            dir.append(.nw)
                        }
                    }
                    i += 1
                }

                i += 1
            }

            directions.append(dir)
        }

        return directions
    }

    func part2() {

        for x in xmin-1...xmax+1 {
            for y in ymin-1...ymax+1 {
                let tile = HexTile(x: x, y: y)
                if tiles[tile] == nil {
                    tiles[tile] = .white
                    setMinAndMax(tile)
                }
            }
        }

        for i in 0..<100 {

            for x in [xmin, xmax] {
                for y in ymin...ymax {
                    let tile = HexTile(x: x, y: y)
                    if tiles[tile] == nil {
                        tiles[tile] = .white
                        setMinAndMax(tile)
                    }
                }
            }

            for x in xmin...xmax {
                for y in [ymin, ymax] {
                    let tile = HexTile(x: x, y: y)
                    if tiles[tile] == nil {
                        tiles[tile] = .white
                        setMinAndMax(tile)
                    }
                }
            }

            var shouldFlip = [HexTile]()

            for t in tiles.keys {
                if tileShouldFlip(t) {
                    shouldFlip.append(t)
                }
            }

            for tk in tiles.keys {
                if shouldFlip.contains(tk) {
                    if let t = tiles[tk] {
                        tiles[tk] = t == .black ? .white : .black
                    }
                }
            }

            let count = tiles.reduce(0, {(a,b) in a + (b.value == .black ? 1 : 0) })
            print("\(i+1) \(count)")
        }
    }

    func tileShouldFlip(_ tile: HexTile) -> Bool {

        let x = tile.x
        let y = tile.y

        let e = HexTile(x: x + 1, y: y)
        let se = HexTile(x: x, y: y + 1)
        let sw = HexTile(x: x - 1, y: y + 1)
        let w = HexTile(x: x - 1, y: y)
        let ne = HexTile(x: x + 1, y: y - 1)
        let nw = HexTile(x: x, y: y - 1)

        let adjacent = [e, se, sw, w, ne, nw]
        for a in adjacent {
            if tiles[a] == nil {
                tiles[a] = .white
                setMinAndMax(tile)
            }
        }

        if let c = tiles[tile] {

            var count = 0
            for adj in adjacent {
                if let a = tiles[adj] {
                    if a == .black {
                        count += 1
                    }
                }
            }

            // print(count)

            if c == .black {
                return count == 0 || count > 2
            } else {
                return count == 2
            }
        }

        return false
    }
}
