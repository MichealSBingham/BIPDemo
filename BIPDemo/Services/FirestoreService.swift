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

    func uploadUsers(from fileName: String, completion: @escaping (Error?) -> Void) {
        // Use JSONLoader to load users
        let users: [User] = JSONLoader.load(fileName, as: [User].self)
        
        let batch = db.batch()
        let usersCollection = db.collection("users")

        for user in users {
            let docRef = usersCollection.document(user.id ?? UUID().uuidString)
            do {
                try batch.setData(from: user, forDocument: docRef)
            } catch let error {
                print("Error writing user to Firestore: \(error)")
                completion(error)
                return
            }
        }

        batch.commit { error in
            if let error = error {
                print("Batch write to Firestore failed: \(error)")
                completion(error)
            } else {
                print("Users successfully uploaded to Firestore.")
                completion(nil)
            }
        }
    }
}
