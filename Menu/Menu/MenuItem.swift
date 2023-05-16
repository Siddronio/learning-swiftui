//
//  MenuItem.swift
//  Menu
//
//  Created by Jhonatan Sidrônio on 22/04/23.
//

import Foundation
 
struct MenuItem: Identifiable { // Identifiable - Follow the protocol
    
    var id: UUID =  UUID() // Follow the protocol, crate a new instance of UUID type assigning a random ID.
    var name:String
    var price:String
    var imageName:String
}
