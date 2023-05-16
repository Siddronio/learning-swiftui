//
//  AuthorModel.swift
//  Quotes
//
//  Created by Jhonatan Sidrônio on 16/05/23.
//

import Foundation

class AuthorModel: ObservableObject {
    
    @Published var authors = [Author]()
    
    init() {
        
        self.authors = DataService.getLocalData()
    }
}
