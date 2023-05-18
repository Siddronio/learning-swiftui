//
//  AsyncImageView.swift
//  AsyncImage
//
//  Created by Jhonatan Sidrônio on 17/05/23.
//

import SwiftUI

// To avoid repetition and keep the code clean, we create a reusable image extension.
extension Image {
    func imageModifier() -> some View {
        self
            .resizable()
            .scaledToFit()
    }
    func iconModifier() -> some View {
        self
            .imageModifier()
            .frame(maxWidth: 128)
            .foregroundColor(.purple)
            .opacity(0.5)
    }
}

struct AsyncImageView: View {
    
    private let imageURL:String = "https://64.media.tumblr.com/2ea351dbf75eb1972f5e1a9be3071729/tumblr_pn7ey7irot1syvn07_1280.jpg"
    
    var body: some View {
    // MARK: - 1. BASIC
    
    // AsyncImage(url: URL(string: imageURL))
    
    // MARK: - 2. SCALE
    
    // AsyncImage(url: URL(string: imageURL), scale: 2.0)
    
    // MARK: - 3. PLACEHOLDER
    // Add a custom placeholder
    /*
     AsyncImage(url: URL(string: imageURL)) { image in
         image.imageModifier()
     } placeholder: {
         Image(systemName: "photo.circle.fill")
             .iconModifier()
     }
     .padding(40)
     */
    
    // MARK: - 4. PHASE
    // To gain more control over the loading process, use this new initializer to indicate the state of the loading operation.
    
    /*
     AsyncImage(url: URL(string: imageURL)) { phase in
     // SUCESS: The image sucessfully loaded.
     // FAILURE: The image failed to load with an error.
     // EMPTY: No imagem is loaded.
     
     if let image = phase.image {
     image.imageModifier()
     } else if phase.error != nil {
     Image(systemName: "ant.circle.fill").iconModifier()
     } else {
     Image(systemName: "photo.circle.fill").iconModifier()
     }
     }
     .padding(40)
     */
    
    // MARK: - 5. ANIMATIONS
    // The Async Imagem Phase is actually an enumeration that keeps track of the current phase of the download operation.
    // Use transaction to activate an animation, then put modifiers on the image.
        
        
    AsyncImage(url: URL(string: imageURL), transaction: Transaction(animation: .spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0.25))) { phase in
        switch phase {
        case .success(let image):
            image
                .imageModifier()
            // .transition(.move(edge: .bottom))
            // .transition(.slide)
                .transition(.scale)
        case.failure(_):
            Image(systemName: "ant.circle.fill").iconModifier()
        case.empty:
            Image(systemName: "photo.circle.fill").iconModifier()
        @unknown default:
            ProgressView()
        }
    }
    .padding(40)
        
    }
}


struct AsyncImageView_Previews: PreviewProvider {
    static var previews: some View {
        AsyncImageView()
    }
}
