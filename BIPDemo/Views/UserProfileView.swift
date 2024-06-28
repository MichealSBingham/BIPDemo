//
//  UserProfileView.swift
//  BIPDemo
//
//  Created by Micheal Bingham on 6/27/24.
//

import SwiftUI
import AVFoundation
import _AVKit_SwiftUI


struct UserProfileView: View {
    let user: User
    @ObservedObject var viewModel: UserFeedViewModel
    @State private var isActionMessageVisible = false
    @State private var action: UserAction = .passed

    var body: some View {
        ZStack {
            if !isActionMessageVisible {
                VStack {
                    ScrollView {
                        profileContent
                            
                        
                       requestDateButton
                        .padding()
                    }
                }
                .ignoresSafeArea()
                .transition(.opacity)

                //MARK: - Pass Button
                passButton
            }

            
            ActionMessageView(isVisible: $isActionMessageVisible, action: action)
        }
        .padding()
    }

    private var profileContent: some View {
        VStack {
            
            UserProfileHeaderView(name: user.firstName, age: user.calculateAge())
                .padding(.bottom)
            
            ProfileComponentsView(components: user.profileComponents, photos: user.photos)
            
            if let vidUrl = URL(string: user.video?.urlString ?? ""){
               // Text("VIDEO HERE")
                //VideoPlayerView(url: vidUrl )
                //VideoPlayer(player: AVPlayer(url:  URL(string: vidUrl)!))
                   // .frame(height: 400)
                // Text("Video should go here!")
                //VideoPlayerView(videoUrl: vidUrl)
            }
            
          
        }
    }
    
    private var passButton: some View {
        VStack {
            Spacer()
            
            HStack{
                Button(action: {
                    performAction(with: .passed)
                }) {
                    PassView()
                }
           
                .transition(.opacity)
                
                Spacer()
            }
            
        }
    }
    
    private var requestDateButton: some View {
        HStack{
            Spacer()
            
            Button{
                performAction(with: .requested)
            } label:{
                RequestADateView()
            }
            
            
           
        }
       
    }

    private func performAction(with action: UserAction) {
        self.action = action
        withAnimation {
            isActionMessageVisible = true
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            withAnimation {
                isActionMessageVisible = false
            }
            viewModel.nextUser()
        }
    }
}



#Preview {
    UserProfileView(user: User.sampleUser, viewModel: UserFeedViewModel())
}

