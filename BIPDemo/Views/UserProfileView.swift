//
//  UserProfileView.swift
//  BIPDemo
//
//  Created by Micheal Bingham on 6/27/24.
//

import SwiftUI


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
            
           
            // Add other user details here
        }
    }
    
    private var passButton: some View {
        VStack {
            Spacer()
            
            HStack{
                Button(action: {
                    performAction(with: .passed)
                }) {
                    Text("Pass")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.red)
                        .cornerRadius(10)
                }
                .padding()
                .transition(.opacity)
                
                Spacer()
            }
            
        }
    }
    
    private var requestDateButton: some View {
        HStack{
            Spacer()
            Button("Request a Date") {
                performAction(with: .requested)
            }
            .padding()
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

