//
//  DataService.swift
//  Quotes
//
//  Created by Jhonatan Sidrônio on 16/05/23.
//

import Foundation

class DataService {
    
    static func getLocalData() -> [Author] {
        
        // Parse the local JSON file
        
        // Get a URL path to JSON file
        let pathstring = Bundle.main.path(forResource: "Data", ofType: "json")
        
        // Check if pathstring is not nill
        guard pathstring != nil else {
            return [Author]()
        }
        
        // Create a URL object
        let url = URL(fileURLWithPath: pathstring!)
        
        do {
            // Create a Data Object
            let data = try Data(contentsOf: url)
            
            // Decode the data with a JSON decoder
            let decoder = JSONDecoder()
            
            do {
                let authorData = try decoder.decode([Author].self, from: data)
                
                // Add the Unique IDs
                for a in authorData {
                    a.id = UUID()
                }
                
                // Return the authors
                return authorData
                
            }
            catch {
                // Error wiht parsing JSON
            }
            
        }
        catch {
            // Error with getting data
            print(error)
        }
        
        return [Author]()
    }
}
