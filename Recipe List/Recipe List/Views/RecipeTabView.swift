//
//  RecipeTabView.swift
//  Recipe List
//
//  Created by Jhonatan Sidrônio on 16/05/23.
//

import SwiftUI

struct RecipeTabView: View {
    
    // To detect the index of the selected tab in a TabView, create a state variable to store the tag value of the selected tab. Then pass that state variable as a binding ($) into the selection parameter of the TabView. Finally, add a tag modifier to each tabItem.
    
    
    var body: some View {
        
        /*
         Add a TabView to your view code followed by a set of curly brackets. Inside the curly brackets put the views for your tabs.
         */
        
        TabView {
            /*
            Text("Featured View")
             To create a tab, add the tabItem modifier to the view that represents the contents of that tab.
            */
            RecipeFeaturedView()
                .tabItem {
                    VStack {
                        Image(systemName: "star.fill")
                        Text("Featured")
                    }
                }
            
            RecipeListView()
                .tabItem {
                    VStack {
                        Image(systemName: "list.bullet")
                        Text("List")
                    }
                }
        }        
        // Make sure that the EnvironmentObject modifier is added to a parent view so that all subviews of the parent view can access the EnvironmentObject.
        .environmentObject(RecipeModel())

        
    }
}

struct RecipeTabView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeTabView()
    }
}
