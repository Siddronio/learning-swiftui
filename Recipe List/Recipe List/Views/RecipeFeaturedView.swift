//
//  RecipeFeaturedView.swift
//  Recipe List
//
//  Created by Jhonatan Sidrônio on 05/06/23.
//

import SwiftUI

struct RecipeFeaturedView: View {
    
    // The EnvironmentObject property helps to pass data from a parent view to subviews in the same view hierarchy.
    @EnvironmentObject var model:RecipeModel
    @State var isDetailViewShowing = false
    @State var tabSelectionIndex = 0
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 0) {
            
            Text("Featured Recipes")
                .padding(.leading)
                .padding(.top, 40)
                .font(Font.custom("Avenir Heavy", size: 30))
                .bold()
            
            GeometryReader { geo in
                TabView(selection: $tabSelectionIndex) {
                    
                    // Check every recipe we have and determine whether the featured property is true or not. Loop through each recipe.
                    ForEach(0..<model.recipes.count, id: \.self) { index in
                        
                        // Only show those that should be featured
                        if model.recipes[index].featured == true {
                            
                            // Recipe Card Button
                            Button {
                                // Show the Recipe Detail sheet
                                // When the button is tapped, this is going to flip the switch to true
                                self.isDetailViewShowing =  true
                            } label: {
                                // Recipe card
                                ZStack {
                                    Rectangle()
                                        .foregroundColor(.white)
                                    
                                    // No space between the image
                                    VStack(spacing: 0)  {
                                        Image(model.recipes[index].image)
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .clipped()
                                        Text(model.recipes[index].name)
                                            .padding(5)
                                            .font(Font.custom("Avenir", size: 15))
                                    }
                                }
                            }
                            .tag(index)
                            
                             // To slide up some sort of view upon tapping the button
                             // $isDetailViewShowing - It's a two way communication, because when the user dismisses that pop up card, we want it to turn this back to false.
                             .sheet(isPresented: $isDetailViewShowing) {
                                 // Show the Recipe Detail View
                                 RecipeDetailView(recipe: model.recipes[index])
                             }
                            .buttonStyle(PlainButtonStyle())
                            .frame(width: geo.size.width - 40, height: geo.size.height - 100, alignment: .center)
                            .cornerRadius(15)
                            .shadow(color: Color(.sRGB ,red: 0, green: 0, blue: 0, opacity: 0.5), radius: 10, x: -5, y: 5)
                            
                        }
                    }
                    
                }
                // Swappable card effect
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
                // After customize the frame and shifted the hight, the dots are no longer visible. This modifier adds a background behind.
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            }
            
            VStack(alignment: .leading, spacing: 5) {
                Text("Preparation Time:")
                    .font(Font.custom("Avenir Heavy", size: 16))
                Text(model.recipes[tabSelectionIndex].prepTime)
                    .font(Font.custom("Avenir", size: 15))
                
                Text("Highlights:")
                    .font(Font.custom("Avenir Heavy", size: 16))
                RecipeHighlightsView(highlights: model.recipes[tabSelectionIndex].highlights)
            }
            .padding([.leading, .bottom])
            
        }
        // The onAppear modifier can be added to a view to run code when the view appears.
        .onAppear {
            setFeaturedIndex()
        }
        
    }
    
    func setFeaturedIndex() {
        // Find the index of the first recipe that is featured
        let index = model.recipes.firstIndex { recipe in
            return recipe.featured
        }
        tabSelectionIndex =  index ?? 0
    }
}

struct RecipeFeaturedView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeFeaturedView()
            .environmentObject(RecipeModel())
    }
}
