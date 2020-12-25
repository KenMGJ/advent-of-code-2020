//
//  day25.swift
//  advent-of-code-2020
//
//  Created by Ken Giroux on 12/24/20.
//

import Foundation

class Day25: Challenge {

    let initialSubject = 7
    let divisor = 20201227

    func part1() {

        let cardPK = 11562782
        let cardLoopSize = calculateLoopSize(cardPK)
        print(cardLoopSize)

        let doorPK = 18108497
        let doorLoopSize = calculateLoopSize(doorPK)
        print(doorLoopSize)

        var encryptionKey = calculateEncryptionKey(cardPK, loopSize: doorLoopSize)
        print(encryptionKey)

        encryptionKey = calculateEncryptionKey(doorPK, loopSize: cardLoopSize)
        print(encryptionKey)
    }

    func calculateLoopSize(_ pk: Int) -> Int {

        var value = 1
        var loopSize = 0

        while value != pk {
            value *= initialSubject
            value = value % divisor
            loopSize += 1
        }

        return loopSize
    }

    func calculateEncryptionKey(_ pk: Int, loopSize: Int) -> Int {

        var value = 1
        for _ in 0..<loopSize {
            value *= pk
            value = value % divisor
        }

        return value
    }

    func part2() {
    }
}
