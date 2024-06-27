//
//  APIService.swift
//  BIPDemo
//
//  Created by Micheal Bingham on 6/27/24.
//

import Foundation
import Firebase

class APIService {
    private let baseURL = "https://us-central1-bipdemo-8602f.cloudfunctions.net/fetchUsers"

    func fetchUsers() async throws -> [User] {
        guard let url = URL(string: baseURL) else {
            throw URLError(.badURL)
        }

        let (data, _) = try await URLSession.shared.data(from: url)
        let users = try JSONDecoder().decode([User].self, from: data)
        return users
    }



}
