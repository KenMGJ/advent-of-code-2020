//
//  day21.swift
//  advent-of-code-2020
//
//  Created by Ken Giroux on 12/21/20.
//

import Foundation

class Day21: Challenge {

    struct food {
        var ingredients: Set<String>
        var allergens: Set<String>
    }

    func part1() {
        var foods = parseInput(input_day21)
        let allergens = extractAllergens(foods)
        let _ = removeIngredientsWithAllergens(allergens: allergens, foods: &foods)

        var count = 0
        for f in foods {
            count += f.ingredients.count
        }
        print(count)
    }

    func parseInput(_ input: String) -> [food] {
        let input = inputToStringArray(input)

        var foods = [food]()

        for i in input {
            var parts = i.split(separator: "(").map({ String($0) })

            let ingredients = parts[0].trimmingCharacters(in: [" "]).split(separator: " ").map({ String($0) })

            parts = parts[1].split(separator: " ").map({ String($0).trimmingCharacters(in: [ ")", "," ]) })
            parts.removeFirst()

            foods.append(food(ingredients: Set(ingredients), allergens: Set(parts)))
        }

        return foods
    }

    func extractAllergens(_ foods: [food]) -> Set<String> {
        var allergens = Set<String>()
        for f in foods {
            for a in f.allergens {
                allergens.insert(a)
            }
        }
        return allergens
    }

    func removeIngredientsWithAllergens(allergens: Set<String>, foods: inout [food]) -> String {

        var found = Set<String>()
        var allergenIngredients = Dictionary<String, String>()

        while found.count < allergens.count {
            for a in allergens {
                if found.contains(a) {
                    continue
                }

                var seen = 0
                var iSeen = Dictionary<String, Int>()

                for f in foods {
                    if f.allergens.contains(a) {
                        seen += 1
                        for f0 in f.ingredients {
                            if let is0 = iSeen[f0] {
                                iSeen[f0] = is0 + 1
                            } else {
                                iSeen[f0] = 1
                            }
                        }
                    }
                }

                // print(iSeen)
                let filtered = iSeen.filter({(k,v) in v == seen })
                if filtered.count == 1 {
                    if let is0 = filtered.first {
                        found.insert(is0.key)

                        // print("\(a) \(is0.key)")
                        for i in 0..<foods.count {
                            allergenIngredients[a] = is0.key
                            foods[i].ingredients.remove(is0.key)
                            foods[i].allergens.remove(a)
                        }
                    }
                }
            }
        }

        var aa = Array(allergens)
        aa.sort()

        var canonicalDangerousIngredientList = [String]()
        for a in aa {
            if let i = allergenIngredients[a] {
                canonicalDangerousIngredientList.append(i)
            }
        }

        return canonicalDangerousIngredientList.joined(separator: ",")
    }

    func part2() {
        var foods = parseInput(input_day21)
        let allergens = extractAllergens(foods)
        let ingredients = removeIngredientsWithAllergens(allergens: allergens, foods: &foods)

        print(ingredients)
    }
}
