//
//  day09.swift
//  advent-of-code-2020
//
//  Created by Ken Giroux on 12/8/20.
//

import Foundation

class Day09: Challenge {

    var queue = [Int]()
    
    func part1() {
        
        let PREAMBLE_LENGTH = 25
        let puzzle_input = inputToIntArray(input_day09)

        let qEnd = puzzle_input.index(puzzle_input.startIndex, offsetBy: PREAMBLE_LENGTH)
        queue = Array(puzzle_input[puzzle_input.startIndex..<qEnd])
        let numbers = Array(puzzle_input[qEnd...])
        
        for n in numbers {
            if sumInQueue(n) {
                queue.removeFirst()
                queue.append(n)
                continue
            } else {
                print("\(n)")
                break
            }
        }
    }
    
    func sumInQueue(_ n: Int) -> Bool {
        for i in 0..<queue.count-1 {
            for j in i+1..<queue.count {
                if n == queue[i] + queue[j] {
                    return true
                }
            }
        }
        return false
    }
    
    func part2() {

        let NUMBER = 1038347917
        let puzzle_input = inputToIntArray(input_day09)
        
        var found = false
        for offset in 0...puzzle_input.count-2 {
            for len in 1...puzzle_input.count-2 {
                let result = findSum(puzzle: puzzle_input, start: offset, length: len)
                if result.sum == NUMBER {
                    print("\(result.smallest + result.largest)")
                    found = true
                    break
                }
            }
            if found {
                break
            }
        }
    }

    func findSum(puzzle: [Int], start: Int, length: Int) -> (sum: Int, smallest: Int, largest: Int) {
        var sum = 0
        var smallest = Int.max
        var largest = Int.min
        
        var end = start+length
        if end > puzzle.endIndex {
            end = puzzle.endIndex
        }
        
        for i in start..<end {
            let n = puzzle[i]
            sum += n
            
            if n < smallest {
                smallest = n
            }
            
            if n > largest {
                largest = n
            }
        }
        return (sum, smallest, largest)
    }
    
}
