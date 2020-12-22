//
//  day20.swift
//  advent-of-code-2020
//
//  Created by Ken Giroux on 12/19/20.
//

import Foundation

struct Connection {
    let sourceOrientation: Orientation
    let targetId: Int
    let targetOrientation: Orientation
}

struct Orientation: Hashable {
    let flipped: Bool
    let edge: Edge

    static func == (lhs: Orientation, rhs: Orientation) -> Bool {
        return lhs.flipped == rhs.flipped && lhs.edge == rhs.edge
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(flipped)
        hasher.combine(edge)
    }
}

enum Edge: Int {
    case Top = 0
    case Left = 1
    case Bottom = 2
    case Right = 3
}

class Tile: CustomStringConvertible, Hashable {
    let id: Int
    var size: Int
    var data: [Bool]

    init(id: Int, map: [String]) {
        self.id = id
        size = map[0].count

        data = Array(repeating: false, count: size * size)
        var i = 0
        for m in Array(map) {
            for c in m {
                data[i] = c == "#"
                i += 1
            }
        }
    }

    init(instance: Tile) {
        self.id = instance.id
        self.size = instance.size
        self.data = instance.data
    }

    func copy() -> Tile {
        return Tile(instance: self)
    }

    var description: String {
        var description = "\nTile \(id):\n"
        for i in 0..<size {
            for j in 0..<size {
                description += data[i * size + j] ? "#" : "."
            }
            description += "\n"
        }
        description += "\n"
        return description
    }

    func rotateClockwise() {

        var temp = Array(repeating: false, count: size * size)

        var i = 0
        for x in 0..<size {
            for y in (0..<size).reversed() {
                temp[i] = data[flattenIndex(i: y, j: x)]
                i += 1
            }
        }

        data = temp
    }

    func flip() {
        for i in 0..<size {
            for j in 0..<(size/2) {
                let idx0 = flattenIndex(i: i, j: j)
                let idx1 = flattenIndex(i: i, j: size - 1 - j)

                let temp = data[idx0]
                data[idx0] = data[idx1]
                data[idx1] = temp
            }
        }
    }

    func tilesCanConnect(_ other: Tile) -> Connection? {

        let selfEdges = self.generateEdges()
        let otherEdges = other.generateEdges()

        for se in selfEdges {
            for oe in otherEdges {
                if se.value == oe.value {
                    return Connection(sourceOrientation: se.key, targetId: other.id, targetOrientation: oe.key)
                }
            }
        }

        return nil
    }

    func generateEdges() -> Dictionary<Orientation, String> {

        var edges = Dictionary<Orientation, String>()

        let copy = Tile(instance: self)
        for i in 0..<4 {
            if let e = Edge(rawValue: i) {
                edges[Orientation(flipped: false, edge: e)] = copy.getTopEdge()
            }
            copy.rotateClockwise()
        }

        copy.flip()

        for i in 0..<4 {
            if let e = Edge(rawValue: i) {
                edges[Orientation(flipped: true, edge: e)] = copy.getTopEdge()
            }
            copy.rotateClockwise()
        }

        return edges
    }

    func getTopEdge() -> String {
        var edge = ""
        for i in 0..<size {
            edge += data[i] ? "#" : "."
        }
        return edge
    }

    internal func flattenIndex(i: Int, j: Int) -> Int {
        return i * size + j
    }

    func removeBorder() {

        let newSize = size - 2
        var newData = Array(repeating: false, count: newSize * newSize)

        var i = 0
        for j in 1..<(size - 1) {
            for k in 1..<(size - 1) {
                newData[i] = data[flattenIndex(i: j, j: k)]
                i += 1
            }
        }

        size = newSize
        data = newData
    }

    static func == (lhs: Tile, rhs: Tile) -> Bool {
        return lhs.id == rhs.id
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

class Day20: Challenge {

    var tiles = [Tile]()

    func part1() {
        makeTileSet(input_day20)

        /*
        let connections = findAllNeighbors()
        var product = 1
        for (k, v) in connections {
            if v.count == 2 {
                product *= k
            }
        }
        print(product)
 */
    }

    let idPattern = #"^Tile (\d+):$"#

    func makeTileSet(_ input: String) {
        let lines = inputToStringArray(input)

        tiles = [Tile]()

        var current = 0
        var tileLines = [String]()

        for l in lines {
            let parts = parseFromRegex(pattern: idPattern, input: l, parts: 1)
            if !parts.isEmpty {
                if let i = Int(parts[0]) {
                    current = i
                }
            } else if l == "" {
                tiles.append(Tile(id: current, map: tileLines))
                current = 0
                tileLines = [String]()
            } else {
                tileLines.append(l)
            }
        }

        if current != 0 {
            tiles.append(Tile(id: current, map: tileLines))
        }
    }

    func findAllNeighbors() -> Dictionary<Tile, [Connection]> {

        var connections = Dictionary<Tile, [Connection]> ()

        for t0 in tiles {
            for t1 in tiles {
                if t0.id != t1.id {
                    if let c = t0.tilesCanConnect(t1) {
                        if connections[t0] == nil {
                            connections[t0] = [ c ]
                        } else {
                            connections[t0]?.append(c)
                        }
                    }
                }
            }
        }

        return connections
    }

    func part2() {
        makeTileSet(input_day20_0)
        print(tiles)
    }

}
