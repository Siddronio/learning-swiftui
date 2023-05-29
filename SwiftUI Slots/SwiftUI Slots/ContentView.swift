//
//  ContentView.swift
//  SwiftUI Slots
//
//  Created by Jhonatan Sidrônio on 03/05/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var credits = 1000
    @State private var slot1 = 1
    @State private var slot2 = 1
    @State private var slot3 = 1

    var body: some View {
        
        ZStack {
            Image("background-wood-grain")
                .resizable()
                .ignoresSafeArea()
            
            VStack {
                Text("SwiftUI Slots!")
                    .padding(.top, 50.0)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                Spacer()
                Text("Credits: \(credits)")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                Spacer()
                
                HStack {
                    Spacer()
                    Image("slot\(slot1)")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    Spacer()
                    Image("slot\(slot2)")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    Spacer()
                    Image("slot\(slot3)")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    Spacer()
                }
                Spacer()
                Button {
                    spin()
                } label: {
                    Text("Spin")
                        .frame(width: 140.0, height: 45.0)
                        .font(.title3)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .background(.black)
                        .cornerRadius(20)
                }
                Spacer()
            }
        }
    }
    
    func spin() {
        // Randomize the slots
        slot1 = Int.random(in: 1...3)
        slot2 = Int.random(in: 1...3)
        slot3 = Int.random(in: 1...3)
        
        // Update credits based on match or not
        if slot1 == slot2 && slot2 == slot3 {
            // Match
            credits += 15
        } else {
            credits -= 5
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
