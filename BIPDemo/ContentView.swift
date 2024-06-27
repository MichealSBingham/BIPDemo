//
//  ContentView.swift
//  BIPDemo
//
//  Created by Micheal Bingham on 6/27/24.
//

import SwiftUI
import Firebase



struct ContentView: View {
    private let firestoreService = FirestoreService()

    var body: some View {
        VStack {
            Button(action: {
                self.testJSONDecoding()
            }) {
                Text("Test JSON Decoding")
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }

            Button(action: {
                firestoreService.uploadUsers(from: "Users") { error in
                    if let error = error {
                        print("Error uploading users: \(error.localizedDescription)")
                    } else {
                        print("Upload successful")
                    }
                }
            }) {
                Text("Upload Users to Firestore")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
        }
        .padding()
    }

    func testJSONDecoding() {
        do {
            let users: [User] = JSONLoader.load("Users", as: [User].self)
            print("Successfully decoded users: \(users)")
        } catch {
            print("Failed to decode users: \(error)")
        }
    }
}




#Preview {
    ContentView()
}
