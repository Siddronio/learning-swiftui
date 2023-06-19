//
//  DataService.swift
//  Recipe List
//
//  Created by Jhonatan Sidrônio on 12/05/23.
//

import Foundation

class DataService {
    
    // The static keyword allows you to call the method on the class itself rather than having to create an instance of it and then calling it on the instance. This can be handy when you just need the method for utility and there's no need to have instances to perform any additional work.
    static func getLocalData() -> [Recipe] {
        
        // Parse the local JSON file
        
        // Get a URL path to the JSON file
        let pathString = Bundle.main.path(forResource: "recipes", ofType: "json") // This method returns a optional.
        
        // Check if pathString is not nil, otherwise...
        guard pathString != nil else { // guard statement is a way to make certain that is true before continuing
            return [Recipe]()
        }
        
        // Create a URL object
        let url = URL(fileURLWithPath: pathString!)
        
        do {
            // Create a Data object
            let data = try Data(contentsOf: url)
            
            // Decode the Data with a JSON decoder
            let decoder = JSONDecoder()
            
            do {
                let recipeData = try decoder.decode([Recipe].self, from: data)
                
                // Add the unique IDs
                for r in recipeData {
                    r.id = UUID()
                    
                    // Add unique IDs to recipe ingredients
                    for i in r.ingredients {
                        i.id = UUID()
                    }
                }
                
                // Return the recipes
                return recipeData
            }
            catch {
                // Error with parsing JSON
                print(error)
            }
           
        }
        catch {
            // Error with getting data
            print(error)
        }
        // If ever gets down here to this point, we return an empty array of recipes.
        return [Recipe]()}
}
