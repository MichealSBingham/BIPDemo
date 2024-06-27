//
//  UserViewModel.swift
//  BIPDemo
//
//  Created by Micheal Bingham on 6/27/24.
//

import Foundation

@MainActor
class UserFeedViewModel: ObservableObject {
    @Published var users: [User] = []
    @Published var currentUser: User?
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?

    private let apiService = APIService()
    private let firestoreService = FirestoreService()

    func loadUsers() async {
        isLoading = true
        errorMessage = nil
        do {
            users = try await apiService.fetchUsers()
            currentUser = users.first
        } catch {
            errorMessage = error.localizedDescription
        }
        isLoading = false
    }

    func addUsers() async {
        isLoading = true
        errorMessage = nil
        do {
            try await firestoreService.uploadUsers(from: "Users")
            await loadUsers()
        } catch {
            errorMessage = error.localizedDescription
        }
        isLoading = false
    }

    func deleteAllUsers() async {
        isLoading = true
        errorMessage = nil
        do {
            try await firestoreService.deleteAllUsers()
            users.removeAll()
            currentUser = nil
        } catch {
            errorMessage = error.localizedDescription
        }
        isLoading = false
    }

    func nextUser() {
        if let currentUserIndex = users.firstIndex(where: { $0.id == currentUser?.id }), currentUserIndex < users.count - 1 {
            currentUser = users[currentUserIndex + 1]
        } else {
            currentUser = nil
        }
    }
}
