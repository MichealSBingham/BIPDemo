//
//  User.swift
//  BIPDemo
//
//  Created by Micheal Bingham on 6/27/24.
//

import Foundation
import FirebaseFirestoreSwift

struct User: Codable, Identifiable {
    @DocumentID var id: String?
    var firstName: String
    var birthDate: BirthDate
    var gender: String
    var education: Education
    var vices: Vices
    var politicalBeliefs: ValueWrapper
    var childrenPresence: ValueWrapper
    var religiousBeliefs: ValueWrapper
    var familyPlans: ValueWrapper
    var hometown: ValueWrapper
    var neighborhood: Neighborhood
    var job: Job
    var height: ValueWrapper
    var ethnicity: [String]
    var relationship: ValueWrapper
    var typeOfRelationship: ValueWrapper
    var profileComponents: [String]
    var photos: [Photo]
    var video: Video?
    var showInFeed: Bool?
    var isSubscribed: Bool?

    enum CodingKeys: String, CodingKey {
        case id = "uid"
        case firstName = "first_name"
        case birthDate = "birth_date"
        case gender
        case education
        case vices
        case politicalBeliefs = "political_beliefs"
        case childrenPresence = "children_presence"
        case religiousBeliefs = "religious_beliefs"
        case familyPlans = "family_plans"
        case hometown
        case neighborhood
        case job
        case height
        case ethnicity
        case relationship
        case typeOfRelationship = "type_of_relationship"
        case profileComponents = "profile_components"
        case photos
        case video
        case showInFeed = "show_in_feed"
        case isSubscribed = "is_subscribed"
    }
}

struct BirthDate: Codable {
    var hidden: Bool
    var value: Int
}

struct Education: Codable {
    var hidden: Bool
    var degree: String
    var place: String
}

struct Vices: Codable {
    var alcohol: ValueWrapper
    var psychedelics: ValueWrapper
    var thcOrWeed: ValueWrapper
    var tobacco: ValueWrapper

    enum CodingKeys: String, CodingKey {
        case alcohol
        case psychedelics
        case thcOrWeed = "thc_or_weed"
        case tobacco
    }
}

struct ValueWrapper: Codable {
    var hidden: Bool
    var value: String
}

struct Neighborhood: Codable {
    var country: String?
    var city: ValueWrapper
    var name: String?
}

struct Job: Codable {
    var hidden: Bool
    var company: String?
    var title: String
}

struct Photo: Codable {
    var uid: String
    var width: Int
    var index: Int
    var height: Int
    var urlString: String

    enum CodingKeys: String, CodingKey {
        case uid
        case width
        case index
        case height
        case urlString = "url_string"
    }
}

struct Video: Codable {
    var uid: String
    var purpose: String
    var width: Int
    var height: Int
    var urlString: String

    enum CodingKeys: String, CodingKey {
        case uid
        case purpose
        case width
        case height
        case urlString = "url_string"
    }
}
