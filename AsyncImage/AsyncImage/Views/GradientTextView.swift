//
//  GradientTextView.swift
//  AsyncImage
//
//  Created by Jhonatan Sidrônio on 17/05/23.
//

import SwiftUI

struct GradientTextView: View {
    var body: some View {
        VStack {
            // MARK: - 1. BASIC GRADIENT TEXT
            
            Text("iOS")
                .foregroundStyle(.teal.gradient)
            
            // MARK: - 2. CUSTOM GRADIENT TEXT
            
            Text("iOS")
                .foregroundStyle(
                    LinearGradient(
                        colors: [.pink, .purple, .blue],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing)
                )
        }
        .font(.system(size: 180))
        .fontWeight(.black)
    }
}

struct GradientTextView_Previews: PreviewProvider {
    static var previews: some View {
        GradientTextView()
    }
}
