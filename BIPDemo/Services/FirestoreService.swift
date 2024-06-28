//
//  FirestoreService.swift
//  BIPDemo
//
//  Created by Micheal Bingham on 6/27/24.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift



class FirestoreService {
    private let db = Firestore.firestore()

    func uploadUsers(from fileName: String) async throws {
        let users: [User] = JSONLoader.load(fileName, as: [User].self)
        let batch = db.batch()
        let usersCollection = db.collection("users")

        for user in users {
            let docRef = usersCollection.document(user.id ?? "id_not_found")
            do {
                try batch.setData(from: user, forDocument: docRef)
            } catch let error {
                throw error
            }
        }

        try await batch.commit()
    }

    func deleteAllUsers() async throws {
        let querySnapshot = try await db.collection("users").getDocuments()
        for document in querySnapshot.documents {
            try await db.collection("users").document(document.documentID).delete()
        }
    }
}


