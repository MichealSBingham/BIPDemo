//
//  ProfileComponentsView.swift
//  BIPDemo
//
//  Created by Micheal Bingham on 6/27/24.
//

import SwiftUI


struct ProfileComponentsView: View {
    let components: [String]
    let photos: [Photo]
    
    var body: some View {
        ForEach(0..<components.count, id: \.self) { index in
            VStack(alignment: .leading) {
                FadeInView {
                    Text(components[index])
                        .padding(.horizontal)
                }
                
                if index < photos.count {
                    FadeInView {
                        RemoteImageView(url: photos[index].urlString)
                            .aspectRatio(contentMode: .fit)
                            .frame(maxWidth: .infinity)
                            .padding(.horizontal)
                            .clipped()
                    }
                }
            }
        }
    }
}

struct FadeInView<Content: View>: View {
    @State private var isVisible = false
    let content: () -> Content
    
    var body: some View {
        content()
            .opacity(isVisible ? 1 : 0)
            .onAppear {
                withAnimation(.easeIn(duration: 0.5)) {
                    isVisible = true
                }
            }
    }
}


#Preview {
    ScrollView{
        ProfileComponentsView(components: User.sampleUser.profileComponents, photos: User.sampleUser.photos)
    }
   
}
