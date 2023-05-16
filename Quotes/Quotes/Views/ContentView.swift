//
//  ContentView.swift
//  Quotes
//
//  Created by Jhonatan Sidrônio on 16/05/23.
//

import SwiftUI

struct ContentView: View {
    
    // Reference the view model
    @ObservedObject var model = AuthorModel()
    
    var body: some View {
        
        // NavigationView to go to detail view
        NavigationView {
            
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    
                    // Card for each author
                    ForEach(model.authors) { a in
                        
                        // Link to detail view
                        NavigationLink {
                            DetailView(author: a)
                        } label: {
                            // Each author card in the scroll view
                            CardView(author: a)
                        }
                        
                    }
                    .navigationTitle("Authors")
                }
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
