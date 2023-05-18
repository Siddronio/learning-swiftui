//
//  ContentTabView.swift
//  AsyncImage
//
//  Created by Jhonatan Sidrônio on 17/05/23.
//

import SwiftUI

struct ContentTabView: View {
    
    @State var tabIndex = 0
    
    var body: some View {
        TabView(selection: $tabIndex) {
          
            AsyncImageView()
                .tabItem {
                    VStack {
                        Image(systemName: "1.circle")
                        Text("Async Image")
                    }
                }
                .tag(0)
                    
            ButtonStyleLinkView()
                .tabItem {
                    VStack {
                        Image(systemName: "2.circle")
                        Text("Button Style Link")
                    }
                }
                .tag(1)
            
            CustomLinkView()
                .tabItem {
                    VStack {
                        Image(systemName: "3.circle")
                        Text("Custom Link")
                    }
                }
                .tag(2)
            
            GradientTextView()
                .tabItem {
                    VStack {
                        Image(systemName: "4.circle")
                        Text("Gradient Text")
                    }
                }
                .tag(3)
        }
    }
}

struct ContentTabView_Previews: PreviewProvider {
    static var previews: some View {
        ContentTabView()
    }
}
