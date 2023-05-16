//
//  CardView.swift
//  Quotes
//
//  Created by Jhonatan Sidrônio on 16/05/23.
//

import SwiftUI

struct CardView: View {

    var author:Author

    var body: some View {

        ZStack {
            // Background Image
            Image(author.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
            
            // Text Stack
            VStack(alignment: .leading, spacing: 10.0) {
                
                // Quote if there is at least 1
                if author.quotes.count > 0 {
                    Text(author.quotes[0])
                        .font(.largeTitle)
                        .fontWeight(.bold)
                }
                
                Text("- " + author.name)
            }
            .padding([.top, .leading], 20)
            .shadow(color: .black, radius: 10, x: 2, y: 2)
            
        }
        .foregroundColor(.white)
        .frame(width: .none, height: 400, alignment: .center)
        .clipped()
        .cornerRadius(15)
        .padding(.horizontal)
        
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        let model = AuthorModel()
        CardView(author: model.authors[0])
    }
}
