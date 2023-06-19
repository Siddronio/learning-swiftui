//
//  RecipeDetailView.swift
//  Recipe List
//
//  Created by Jhonatan Sidrônio on 14/05/23.
//

import SwiftUI
/*
 This view relies on having a reference for a single recipe.
 */

struct RecipeDetailView: View {
    
    // Unset for now. It's going to be determined by what the user tapps on the list view.
    var recipe:Recipe
    
    @State var selectServingSize = 2
    
    var body: some View {
        
        ScrollView {
            VStack(alignment: .leading) {
                // MARK: - Recipe Image
                Image(recipe.image)
                    .resizable()
                    .scaledToFill()
                    // .cornerRadius(10)
                    // .padding(.horizontal)
                
                // MARK: - Recipe Title
                Text(recipe.name)
                    .bold()
                    .padding(.top, 20)
                    .padding(.leading)
                    .font(Font.custom("Avenir Heavy", size: 30))
                
                
                // MARK: - Serving Size Picker
                VStack(alignment: .leading) {
                    Text("Select your serving size:")
                        .font(Font.custom("Avenir", size: 15))
                    Picker("", selection: $selectServingSize) {
                        Text("2").tag(2)
                        Text("4").tag(4)
                        Text("6").tag(6)
                        Text("8").tag(8)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .frame(width: 160)
                    .font(Font.custom("Avenir", size: 15))
                    
                }
                .padding()
                // MARK: - Ingredients
                VStack(alignment: .leading) {
                    Text("Ingredients")
                        .font(Font.custom("Avenir Heavy", size: 16))
                        .padding([.bottom, .top], 5)
                    ForEach(recipe.ingredients) { item in
                        Text("• " + RecipeModel.getPortion(ingredient: item, recipeServings: recipe.servings, targetServings: selectServingSize) + " " + item.name.lowercased())
                            .font(Font.custom("Avenir", size: 15))
                    }
                }
                .padding(.horizontal) // Equals [.leading, .trailling]
                
                // MARK: - Divider
                Divider()
                
                // MARK: - Directions
                VStack(alignment: .leading) {
                    Text("Directions")
                        .font(Font.custom("Avenir Heavy", size: 16))
                        // Instead of top and bottom, use a an array
                        .padding([.bottom, .top], 5)
                  /*
                    ForEach(recipe.directions, id: \.self) { item in
                       Text(item)
                    Instead of looping through recipe.directions, we want to create steps with numbers, so we need a index.
                     */
                    ForEach(0..<recipe.directions.count, id: \.self) { index in
                        // Pass the index to get that specific String.
                        // (index+1) to start from 1 instead 0.
                        Text(String(index+1) + ". " + recipe.directions[index])
                            .padding(.bottom, 3)
                            .font(Font.custom("Avenir", size: 15))
                    }
                }
                .padding(.horizontal)
            }
            
        }
        
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        // Create a dummy recipe and pass it into the detail view, so that we can see a preview.
        let model = RecipeModel()
        RecipeDetailView(recipe: model.recipes[0])
    }
}
