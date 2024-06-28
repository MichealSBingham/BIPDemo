//
//  ContentView.swift
//  BIPDemo
//
//  Created by Micheal Bingham on 6/27/24.
//

import SwiftUI
import Firebase



struct ContentView: View {
    @StateObject private var viewModel = UserFeedViewModel()

    var body: some View {
        VStack {
            if viewModel.isLoading {
                LoadingView()
            } else if let errorMessage = viewModel.errorMessage {
                Text("Error: \(errorMessage)")
            } else if let currentUser = viewModel.currentUser {
                UserProfileView(user: currentUser, viewModel: viewModel)
            } else {
                
                //MARK: - Entry point View
                ZStack{
                    
                    Image("Butler")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100, height: 100)
                        .padding(.leading)
                        .transition(.scale)
                        .animation(.easeInOut(duration: 0.5))
                    
                    VStack {
                        
                        Spacer()
                        
                        NextButtonView(action: {
                            Task {
                                await viewModel.addUsersAndLoad()
                            }
                        }, text: "Add Users")
                        
                        .padding()
                    }
                    
                }
                
            }
        }
    }
}









#Preview {
    ContentView()
}
