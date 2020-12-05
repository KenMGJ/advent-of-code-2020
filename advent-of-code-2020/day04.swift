//
//  day04.swift
//  advent-of-code-2020
//
//  Created by Ken Giroux on 12/3/20.
//

import Foundation

class Day04: Challenge {

    func part1() {
        let passports = linesToPassports(inputToStringArray(input_day04))

        let valid = passports.reduce(0, { a, b in a + ( isValidPart1(b) ? 1 : 0 ) })
        print("\(valid)")
    }
    
    func linesToPassports(_ lines: [String]) -> [Dictionary<String, String>] {
        
        var passports = [Dictionary<String, String>]()
        var passport = Dictionary<String, String>()
        
        for line in lines {

            let splitLine = line.split(separator: " ")
            
            if splitLine.isEmpty {
                passports.append(passport)
                passport = Dictionary<String, String>()
                continue
            }
            
            for kvs in splitLine {
                let kv = kvs.split(separator: ":")
                passport[String(kv[0])] = String(kv[1])
            }
        }
        
        passports.append(passport)
        return passports
    }
    
    func isValidPart1(_ passport: Dictionary<String, String>) -> Bool {

        let fields = ["byr","iyr","eyr","hgt","hcl","ecl","pid"]
        
        var valid = true

        for f in fields {
            if passport[f] == nil {
                valid = false
                break
            }
        }
        
        return valid
    }
    
    func part2() {
        let passports = linesToPassports(inputToStringArray(input_day04))

        let valid = passports.reduce(0, { a, b in a + ( isValidPart2(b) ? 1 : 0 ) })
        print("\(valid)")
    }
    
    func isValidPart2(_ passport: Dictionary<String, String>) -> Bool {
        if !isValidPart1(passport) {
            return false
        }

        if !isYearBetween(passport, field: "byr", min: 1920, max: 2002) {
            return false
        }

        if !isYearBetween(passport, field: "iyr", min: 2010, max: 2020) {
            return false
        }
        
        if !isYearBetween(passport, field: "eyr", min: 2020, max: 2030) {
            return false
        }
 
        if !isHeightBetween(passport) {
            return false
        }
        
        if !isHairColorValid(passport) {
            return false
        }

        if !isEyeColorValid(passport) {
            return false
        }

        if !isPassportIdValid(passport) {
            return false
        }

        return true
    }

    func isEyeColorValid(_ passport: Dictionary<String, String>) -> Bool {

        let eyeColorPattern = #"^(amb|blu|brn|gry|grn|hzl|oth)$"#
        if let ecl = passport["ecl"] {
            return ecl.range(of: eyeColorPattern, options: .regularExpression) != nil
        }
            
        return false
    }

    func isHairColorValid(_ passport: Dictionary<String, String>) -> Bool {

        let hairColorPattern = #"^#[0-9a-f]{6}$"#
        if let hcl = passport["hcl"] {
            return hcl.range(of: hairColorPattern, options: .regularExpression) != nil
        }
            
        return false
    }

    func isHeightBetween(_ passport: Dictionary<String, String>) -> Bool {
        
        let heightPattern = #"^(\d+)(cm|in)$"#
        if let hgt = passport["hgt"] {

            let parts = parseFromRegex(pattern: heightPattern, input: hgt, parts: 2)
            if parts.count != 2 {
                return false
            }
            
            if let b = Int(parts[0]) {
                return parts[1] == "cm" ? b >= 150 && b <= 193 : b >= 59 && b <= 76
            } else {
                return false
            }
        }
        
        return false
    }

    func isPassportIdValid(_ passport: Dictionary<String, String>) -> Bool {

        let pidPattern = #"^[0-9]{9}$"#
        if let pid = passport["pid"] {
            return pid.range(of: pidPattern, options: .regularExpression) != nil
        }
            
        return false
    }

    func isYearBetween(_ passport: Dictionary<String, String>, field: String, min: Int, max: Int) -> Bool {
        
        let fourDigitPattern = #"^(\d{4})$"#

        if let val = passport[field] {

            let parts = parseFromRegex(pattern: fourDigitPattern, input: val, parts: 1)
            if parts.count != 1 {
                return false
            }
            
            if let b = Int(parts[0]) {
                return b >= min && b <= max
            } else {
                return false
            }
        }
        
        return false
    }
    
}
