//
//  RecipeModel.swift
//  Recipe List
//
//  Created by Jhonatan Sidrônio on 12/05/23.
//

import Foundation

class RecipeModel: ObservableObject {
    
    @Published var recipes = [Recipe]()
    
    init() {
        
        // Create an instance of DataService and get the data
        /*
         self.recipes = DataService().getLocalData() // Instead of creating an instance and assigning it to a constant first, we'll use self to create an instance and call the method in just one line of code. Use it only if you call an instance once. Another easy way is just turn the method into a type method using: static func getLocalData() in the DataService to call directly, so don't need to create an instance.
         
         */
        
        self.recipes = DataService.getLocalData()
    }
    
    static func getPortion(ingredient: Ingredient, recipeServings: Int, targetServings: Int) -> String {
        
        var portion = ""
        
        // ?? nil coalescing operator - It gives you an alternative if the optional happens to be nil
        var numerator = ingredient.num ?? 1
        var denominator =  ingredient.denom ?? 1
        var wholePortions = 0 // We get the whole numer because we're working with integers.
        
        if ingredient.num != nil {
            
            // Get a single serving size by multiplying denominator by the recipe servings
            denominator *= recipeServings
            
            // Get target portion by multiplying numerator by target servings
            numerator *= targetServings
            
            // Reduce fraction by greatest common divisor
            let divisor = Rational.greatestCommonDivisor(numerator, denominator)
            numerator /= divisor
            denominator /= divisor
            
            // Get the whole portion if numerator > denominator
            if numerator >= denominator {
                
                // Calculate the whole portions
                wholePortions = numerator / denominator
                
                // Calculate the remainder
                // The % operator is the modulo operator, which calculates the remainder between two integers. For example, 5 % 2 = 1
                numerator = numerator % denominator // We have to modify the numerator to express the remainder using the module operator
                
                // Assign to portion string
                portion += String(wholePortions) // =+ (Append)
            }
            
            // Express the remainder as a fraction - Check if it's a fraction
            if numerator > 0 {
                // Assign the remainder as fraction to the portion string
                portion += wholePortions > 0 ? " " : ""
                portion += "\(numerator)/\(denominator)"
                
            }
        }
        
        if var unit = ingredient.unit {
            
            // If we need to pluralize
            if wholePortions > 1 {
                
                // Calculate appropriate suffix
                if unit.suffix(2) == "ch" {
                    unit += "es"
                }
                else if unit.suffix(1) == "f" {
                    unit = String(unit.dropLast())
                    unit += "ves"
                }
                else {
                    unit += "s"
                }
            }
            
            portion += ingredient.num == nil && ingredient.denom == nil ? "" : " "
            
            return portion + unit
        }
        
        return portion
    }
    
    
}
