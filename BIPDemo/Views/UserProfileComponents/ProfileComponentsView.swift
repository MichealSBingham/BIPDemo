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
                Text(components[index])
                    .padding(.horizontal)
                    .transition(.opacity)

                if index < photos.count {
                    RemoteImageView(url: photos[index].urlString)
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: .infinity)
                        .padding(.horizontal)
                        .clipped()
                        .transition(.opacity)
                     
                }
            }
        }
    }
}


#Preview {
    ScrollView{
        ProfileComponentsView(components: User.sampleUser.profileComponents, photos: User.sampleUser.photos)
    }
   
}
