//
//  Author.swift
//  Quotes
//
//  Created by Jhonatan Sidrônio on 16/05/23.
//

import Foundation

class Author: Identifiable, Decodable {
    
    var id:UUID?
    var name:String
    var image:String
    var quotes:[String]
    
}
