//
//  DetailView.swift
//  Quotes
//
//  Created by Jhonatan Sidrônio on 16/05/23.
//

import SwiftUI

struct DetailView: View {
    
    var author:Author?
    
    var body: some View {
        
        
        // If no meditation set, can't display detail
        if let author = author {
            VStack(alignment: .leading, spacing:  20) {
                Text(author.name)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                 Divider()
                
                ForEach(author.quotes, id: \.self) { q in
                    Text(q)
                    
                }
                Spacer()
            }
            .padding()
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        let model = AuthorModel()
        DetailView(author: model.authors[0])
    }
}
