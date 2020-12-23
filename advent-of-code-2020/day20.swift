//
//  day20.swift
//  advent-of-code-2020
//
//  Created by Ken Giroux on 12/19/20.
//

import Foundation

class Tile: CustomStringConvertible, Hashable {
    static var debug = true

    let id: Int
    var size: Int
    var data: [[Character]]

    init(id: Int, map: [String]) {
        self.id = id
        size = map[0].count

        data = [[Character]]()
        for m in map {
            data.append(Array(m))
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
        var description = Self.debug ? "\nTile \(id):\n" : ""
        description += data.joined(separator: "\n")
        return description
    }

    func rotateCounterClockwise() {
        for x in 0..<(size / 2) {
            for y in x..<(size - x - 1) {
                let temp = data[x][y];
                data[x][y] = data[y][size - 1 - x]
                data[y][size - 1 - x] = data[size - 1 - x][size - 1 - y]
                data[size - 1 - x][size - 1 - y] = data[size - 1 - y][x]
                data[size - 1 - y][x] = temp;
            }
        }
    }

    func flip() {
        for i in 0..<size {
            for j in 0..<(size/2) {
                let temp = data[i][j]
                data[i][j] = data[i][size-1-j]
                data[i][size-1-j] = temp
            }
        }
    }

    func top() -> String {
        return String(data[0])
    }

    func bottom() -> String {
        return String(data[size - 1])
    }

    func left() -> String {
        return data.reduce("", {(a,b) in a + String(b[0]) })
    }

    func right() -> String {
        return data.reduce("", {(a,b) in a + String(b[size - 1]) })
    }

    func removeBorder() {

        let newSize = size - 2
        var newData = [[Character]]()

        for j in 1..<(size - 1) {
            newData.append(Array(data[j][1...size-2]))
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

    let idPattern = #"^Tile (\d+):$"#
    var tiles = [Tile]()
    var neighbors = Dictionary<Tile, Set<Tile>>()

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

    func findNeighbors() {
        neighbors = Dictionary<Tile, Set<Tile>>()

        for t0 in tiles {
            var tNeighbors = Set<Tile>()

            for t1 in tiles {
                if t0 != t1 && shareBorder(t0, t1) {
                    tNeighbors.insert(t1)
                }
            }

            neighbors[t0] = tNeighbors
        }
    }

    internal func shareBorder(_ t0: Tile, _ t1: Tile) -> Bool {

        let t0 = Tile(instance: t0)
        let t1 = Tile(instance: t1)

        if shareBorderPartial(t0, t1) {
            return true
        }

        t0.flip()
        return shareBorderPartial(t0, t1)
    }

    internal func shareBorderPartial(_ t0: Tile, _ t1: Tile) -> Bool {

        let t0 = Tile(instance: t0)
        let t1 = Tile(instance: t1)

        for _ in 0...3 {
            t0.rotateCounterClockwise()

            for i in 0...7 {
                if i == 4 {
                    t1.flip()
                }

                t1.rotateCounterClockwise()

                if Array(t0.data[0]) == Array(t1.data[0]) {
                    return true
                }
            }
        }

        return false
    }

    func generatePart2Input() -> [String] {

        let imageSize = Int(sqrt(Double(tiles.count)))
        var image = [[Tile?]](repeating: [Tile?](repeating: nil, count: imageSize), count: imageSize)

        Tile.debug = true

        var placed = Set<Tile>()

        if var t0 = neighbors.first(where: {(k,v) in v.count == 2 }) {

            let t0_0 = t0.key
            let t0_1 = t0.value.removeFirst()
            let t1_0 = t0.value.removeFirst()

            for _ in 0...3 {
                t0_0.rotateCounterClockwise()

                var found = false
                for i in 0...7 {

                    if i == 4 {
                        t0_1.flip()
                    }

                    t0_1.rotateCounterClockwise()

                    if t0_0.right() == t0_1.left() {
                        found = true
                        break
                    }
                }

                if found {
                    break
                }
            }

            var matched = false
            for _ in 0...3 {
                t1_0.rotateCounterClockwise()

                if t0_0.bottom() == t1_0.top() {
                    matched = true
                    break
                }
            }

            if !matched {
                t0_0.flip()
                t0_1.flip()

                for _ in 0...3 {
                    t0_0.rotateCounterClockwise()

                    var found = false
                    for i in 0...7 {

                        if i == 4 {
                            t0_1.flip()
                        }

                        t0_1.rotateCounterClockwise()

                        if t0_0.right() == t0_1.left() {
                            found = true
                            break
                        }
                    }

                    if found {
                        break
                    }
                }

                for _ in 0...3 {
                    t1_0.rotateCounterClockwise()

                    if t0_0.bottom() == t1_0.top() {
                        break
                    }
                }
            }

            image[0][0] = t0_0
            image[0][1] = t0_1
            image[1][0] = t1_0

            placed.insert(t0_0)
            placed.insert(t0_1)
            placed.insert(t1_0)
        }

        for x in 0..<imageSize {
            if image[0][x] == nil {
                if let left = image[0][x - 1] {
                    if let t = neighbors.first(where: { (k,v) in v.count < 4 && v.contains(left) && !placed.contains(k) }) {
                        let t0 = t.key
                        for i in 0...7 {
                            if i == 4 {
                                t0.flip()
                            }

                            t0.rotateCounterClockwise()

                            if left.right() == t0.left() {
                                image[0][x] = t0
                                placed.insert(t0)
                                break
                            }
                        }
                    }
                }
            }
        }

        for y in 0..<imageSize {
            if image[y][0] == nil {
                if let up = image[y - 1][0] {
                    if let t = neighbors.first(where: { (k,v) in v.count < 4 && v.contains(up) && !placed.contains(k) }) {
                        let t0 = t.key
                        for i in 0...7 {
                            if i == 4 {
                                t0.flip()
                            }

                            t0.rotateCounterClockwise()

                            if up.bottom() == t0.top() {
                                image[y][0] = t0
                                placed.insert(t0)
                                break
                            }
                        }
                    }
                }
            }
        }

        for y in 1..<imageSize {
            for x in 1..<imageSize {
                if let left = image[y][x - 1] {
                    if let up = image[y - 1][x] {
                        if let t = neighbors.first(where: { (k,v) in v.contains(up) && v.contains(left) && !placed.contains(k) }) {
                            let t0 = t.key
                            for i in 0...7 {
                                if i == 4 {
                                    t0.flip()
                                }

                                t0.rotateCounterClockwise()

                                if left.right() == t0.left() && up.bottom() == t0.top() {
                                    image[y][x] = t0
                                    placed.insert(t0)
                                    break
                                }
                            }
                        }
                    }
                }
            }
        }

        for rows in image {
            for row in rows {
                if let r = row {
                    r.removeBorder()
                }
            }
        }

        var output = [String]()
        for rows in image {
            if let r0 = rows[0] {
                for i in 0..<r0.size {
                    var rs = ""
                    for row in rows {
                        if let r = row {
                            rs += String(r.data[i])
                            print(String(r.data[i]), terminator: "")
                        }
                    }
                    print()
                    output.append(rs)
                }
            }
        }

        return output
    }

    func part1() {
        makeTileSet(input_day20)

        findNeighbors()

        var product = 1
        for n in neighbors {
            if n.value.count == 2 {
                product *= n.key.id
            }
        }

        print(product)
    }

    let patternTop = #"^.{18}#.$"#
    let patternMid = #"^#.{4}#{2}.{4}#{2}.{4}#{3}$"#
    let patternBot = #"^.#.{2}#.{2}#.{2}#.{2}#.{2}#.{3}$"#

    func part2() {
        let input = generatePart2Input()
        let image = Tile(id: 0, map: input)

        // print(image)

        var monsters = 0
        for i in 0...7 {
            if i == 4 {
                image.flip()
            }

            image.rotateCounterClockwise()

            var count = 0

            for y in 2..<image.size {
                for x in 0...image.size - 20 {
                    let data = image.data

                    let topY = y - 2
                    let midY = y - 1
                    let botY = y

                    let top = String(data[topY][x..<x+20])
                    let mid = String(data[midY][x..<x+20])
                    let bot = String(data[botY][x..<x+20])

                    // print("\(top) \(top.count)")
                    // print("\(mid) \(mid.count)")
                    // print("\(bot) \(bot.count)")

                    if matchesRegex(pattern: patternTop, input: top) && matchesRegex(pattern: patternMid, input: mid) && matchesRegex(pattern: patternBot, input: bot) {

                        // print("\(i) \(y) \(x)")

                        count += 1
                    }
                }
            }

            monsters = max(monsters, count)
        }

        let hashCount = image.data.reduce(0, {(a,b) in a + b.reduce(0, {(c,d) in c + (d == "#" ? 1 : 0) })})
        print(hashCount - (monsters * 15))

        // 2519 - too high
    }

}
