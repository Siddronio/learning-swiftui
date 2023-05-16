//
//  ContentView.swift
//  Menu
//
//  Created by Jhonatan Sidrônio on 22/04/23.
//

import SwiftUI

struct MenuView: View {
    
    @State var menuItens:[MenuItem] = [MenuItem]() // @State - property wrapper to have the UI pay attention to specific properties and update all the views if the values of those properties change.
    var dataService = DataService() // Assign a instance of the struct DataService whit the ().
    
    var body: some View {
        
        List(menuItens) { item in
            
         // Instance of the new subview passing the menu item to display, or whatever the List is referencing.
            MenuListRow(item: item)

        }
        
        // Customizing the row
        .listStyle(.plain)
        .onAppear {
            // Call for the data
            menuItens = dataService.getdata()
        }
    
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
