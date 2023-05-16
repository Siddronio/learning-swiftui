//
//  MenuListRow.swift
//  Menu
//
//  Created by Jhonatan Sidrônio on 23/04/23.
//

import SwiftUI

struct MenuListRow: View {
    
    // You can create a property for every single (imageName, name and price) or create a property for the item itself.
    // var imageName: String
    var item: MenuItem
        
    var body: some View {
        
        HStack {
            Image(item.imageName) // Reading for the property var item: MenuItem
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 50)
                .cornerRadius(10)
            
            Text(item.name)
                .bold()
            
            Spacer()
            
            Text("$" + item.price)
            
        }
        // Remove the separator lines with this modifier. We put not in the list itself, but on what represents a row.
        .listRowSeparator(.hidden)
        // Add a background
        .listRowBackground(
            Color(.brown)
                .opacity(0.1)
        )

    }
}

struct MenuListRow_Previews: PreviewProvider {
    static var previews: some View {
        //
        MenuListRow(item: MenuItem(name: "Test Item", price: "3.99", imageName: "tako-sushi"))
    }
}
