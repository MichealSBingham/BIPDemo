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

    var body: some View {
        VStack {
            Text(user.firstName)
                .font(.largeTitle)
            // Add other user details here

            HStack {
                Button("Pass") {
                    viewModel.nextUser()
                }
                .padding()
                
                Button("Request a Date") {
                    viewModel.nextUser()
                }
                .padding()
            }

            if viewModel.currentUser == nil {
                Button("Start Over") {
                    Task {
                        await viewModel.deleteAllUsers()
                        await viewModel.addUsers()
                    }
                }
                .padding()
            }
        }
        .padding()
    }
}


/*
#Preview {
    UserProfileView()
}
*/
