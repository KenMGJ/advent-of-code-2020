//
//  day03.swift
//  advent-of-code-2020
//
//  Created by Ken Giroux on 12/2/20.
//

import Foundation

class Day03: Challenge {
    
    func part1() {
        
        let right = 3
        let down = 1
        
        let map = inputToCharArrayArray(input_day03)
        let trees = countTrees(map: map, right: right, down: down)
        
        print("\(trees)")
    }
    
    func countTrees(map: [[Character]], right: Int, down: Int) -> Int {

        var x = 0
        var trees = 0
        
        for y in stride(from: 0, to: map.count, by: down) {
            if map[y][x % map[y].count] == "#" {
                trees += 1
            }

            x += right
        }
        
        return trees
    }
    
    func part2() {

        let map = inputToCharArrayArray(input_day03)
        let inputs = [[1,1],[3,1],[5,1],[7,1],[1,2]]

        var trees = 1

        for i in inputs {
            trees *= countTrees(map: map, right: i[0], down: i[1])
        }
        
        print("\(trees)")
    }
}
