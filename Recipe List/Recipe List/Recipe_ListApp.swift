//
//  Recipe_ListApp.swift
//  Recipe List
//
//  Created by Jhonatan Sidrônio on 12/05/23.
//

import SwiftUI

@main
struct Recipe_ListApp: App {
    var body: some Scene {
        WindowGroup {
            RecipeTabView() // RecipeTabView will be the entry point
                   // .environmentObject(RecipeModel()) // You can put the environment modifier here inside the app entry point instead of RecipeTabView.

        }
    }
}
