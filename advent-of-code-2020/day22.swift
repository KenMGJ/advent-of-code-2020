//
//  day22.swift
//  advent-of-code-2020
//
//  Created by Ken Giroux on 12/22/20.
//

import Foundation

class Day22: Challenge {

    var player1 = [Int]()
    var player2 = [Int]()

    func part1() {
        let input = inputToStringArray(input_day22)
        deal(input)
        play()
    }

    func deal(_ input: [String]) {

        player1.removeAll()
        player2.removeAll()

        var p1 = true

        for line in input {
            if line == "Player 1:" {
                p1 = true
            } else if line == "Player 2:" {
                p1 = false
            } else if let i = Int(line) {
                if p1 {
                    player1.append(i)
                } else {
                    player2.append(i)
                }
            }
        }
    }

    func play() {
        while !player1.isEmpty && !player2.isEmpty {
            let p1 = player1.removeFirst()
            let p2 = player2.removeFirst()

            if p1 > p2 {
                player1.append(p1)
                player1.append(p2)
            } else if p2 > p1 {
                player2.append(p2)
                player2.append(p1)
            }
        }

        let winner = player1.isEmpty ? player2 : player1
        var score = 0
        for i in 0..<winner.count {
            score += winner[i] * (winner.count - i)
        }
        print(score)
    }

    func part2() {
        let input = inputToStringArray(input_day22)
        deal(input)

        let _ = playRecursive(game: 1, player1: player1, player2: player2)
    }

    func playRecursive(game: Int, player1: [Int], player2: [Int]) -> Bool {

        var player1 = player1
        var player2 = player2

        var player1Hist = Set<String>()

        var p1wins = false
        while !player1.isEmpty && !player2.isEmpty {

            let p1s = player1.map({ String($0) }).joined(separator: ",")
            if player1Hist.contains(p1s) {
                return true
            }
            player1Hist.insert(p1s)

            let p1 = player1.removeFirst()
            let p2 = player2.removeFirst()

            if player1.count >= p1 && player2.count >= p2 {
                p1wins = playRecursive(game: game + 1, player1: Array(player1[0..<p1]), player2: Array(player2[0..<p2]))
            } else {
                p1wins = p1 > p2
            }
            if p1wins {
                player1.append(p1)
                player1.append(p2)
            } else {
                player2.append(p2)
                player2.append(p1)
            }
        }

        if game == 1 {
            let winner = player1.isEmpty ? player2 : player1
            var score = 0
            for i in 0..<winner.count {
                score += winner[i] * (winner.count - i)
            }
            print(score)
        }
        return p1wins
    }
}
