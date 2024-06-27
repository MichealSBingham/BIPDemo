//
//  ContentView2.swift
//  BIPDemo
//
//  Created by Micheal Bingham on 6/27/24.
//

import SwiftUI

/*
struct ContentView2: View {
    @State private var users: [User] = []
    @State private var isLoading = false
    @State private var errorMessage: String?

    private let userService = APIService()

    var body: some View {
        VStack {
            if isLoading {
                ProgressView("Loading...")
            } else if let errorMessage = errorMessage {
                Text("Error: \(errorMessage)")
            } else {
                List(users) { user in
                    VStack(alignment: .leading) {
                        Text(user.firstName)
                        // Display other user information here
                    }
                }
            }
        }
        .onAppear {
            fetchUsers()
        }
    }

    private func fetchUsers() {
        isLoading = true
        errorMessage = nil

        userService.fetchUsers { result in
            DispatchQueue.main.async {
                isLoading = false

                switch result {
                case .success(let users):
                    self.users = users
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                }
            }
        }
    }
}
*/

/*
#Preview {
    ContentView2()
}
*/
