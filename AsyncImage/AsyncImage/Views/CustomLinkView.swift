//
//  CustomLinkView.swift
//  AsyncImage
//
//  Created by Jhonatan Sidrônio on 17/05/23.
//

import SwiftUI

struct CustomLinkView: View {
    var body: some View {
        Link(destination: URL(string: "https://apple.com")!) {
            HStack(spacing: 15) {
                Image(systemName: "apple.logo")
                Text("Apple Store")
            }
            .font(.largeTitle)
            .foregroundColor(.white)
            .padding()
            .padding(.horizontal)
            .background(
                Capsule()
                    .fill(.black)
            )
        }
    }
}

struct CustomLinkView_Previews: PreviewProvider {
    static var previews: some View {
        CustomLinkView()
    }
}
