//
//  RecipeListView.swift
//  Recipe List
//
//  Created by Jhonatan Sidrônio on 12/05/23.
//

import SwiftUI

struct RecipeListView: View {
    
    // To use an EnvironmentObject in a subview, make sure to use the EnvironmentObject property (Ex. @EnvironmentObject var test: ....).
    @EnvironmentObject var model:RecipeModel
    
    var body: some View {
        
        
        NavigationView {
            VStack(alignment: .leading) {
                Text("All Recipes")
                    .padding(.top, 40)
                    .font(Font.custom("Avenir Heavy", size: 30))
                    .bold()
                
                ScrollView {
                    // LazyVStacks and VStacks are functionally the same, but the main difference is that LazyVStacks are rendered lazily: it only renders items as needed/when they come into frame.
                    LazyVStack(alignment: .leading) {
                        ForEach(model.recipes) { r in
                            NavigationLink {
                                RecipeDetailView(recipe: r)
                            } label: {
                                // MARK: - Row item
                                HStack(spacing: 20.0) {
                                    Image(r.image)
                                        .resizable()
                                    //  .aspectRatio(contentMode: .fill) or
                                        .scaledToFill()
                                        .frame(width: 50, height: 50, alignment: .center)
                                        .cornerRadius(5)
                                        .clipped() // Stop an image from overflowing out of its frame
                                    
                                    VStack(alignment: .leading) {
                                        Text(r.name)
                                            .foregroundColor(.black)
                                            .font(Font.custom("Avenir Heavy", size: 16))
                                        RecipeHighlightsView(highlights: r.highlights)
                                            .foregroundColor(.black)
                                    }
                                }
                            }
                        }
                    }
                }
            }
            .navigationBarHidden(true) // To hide a NavigationBarTitle
            .padding(.leading)
        }
    }
}

struct RecipeListView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListView()
            .environmentObject(RecipeModel())
        /* Put here because of the error "To resolve this add .environmentObject(RecipeModel()) to the appropriate preview".
         */
    }
}
