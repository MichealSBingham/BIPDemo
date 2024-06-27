//
//  User.swift
//  BIPDemo
//
//  Created by Micheal Bingham on 6/27/24.
//

import Foundation
import FirebaseFirestoreSwift


struct User: Codable, Identifiable {
    var id: String?
    var firstName: String
    var birthDate: BirthDate
    var gender: Gender
    var education: Education
    var vices: Vices
    var politicalBeliefs: ValueWrapper<PoliticalBelief>
    var childrenPresence: ValueWrapper<ChildrenPresence>
    var religiousBeliefs: ValueWrapper<ReligiousBelief>
    var familyPlans: ValueWrapper<FamilyPlans>
    var hometown: ValueWrapper<String>
    var neighborhood: Neighborhood
    var job: Job
    var height: ValueWrapper<Int>
    var ethnicity: ValueWrapper<[Ethnicity]>
    var relationships: ValueWrapper<[Relationship]>
    var typeOfRelationship: ValueWrapper<String>?
    var profileComponents: [String]
    var photos: [Photo]
    var video: Video? // There were some optional fields here so I had to make this optional because "purpose" was missing from the documentation
    var showInFeed: Bool?
    var isSubscribed: Bool? // This also wasn't included in the documenation
    var pets: [String: Int]?

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
        case relationships = "relationships"
        case typeOfRelationship = "type_of_relationship"
        case profileComponents = "profile_components"
        case photos
        case video
        case showInFeed = "show_in_feed"
        case isSubscribed = "is_subscribed"
        case pets
    }
}

struct BirthDate: Codable {
    var hidden: Bool
    var value: Int
}

struct Education: Codable {
    var hidden: Bool
    var degree: EducationDegree
    var place: String
}

struct Vices: Codable {
    var alcohol: ValueWrapper<Vice>
    var psychedelics: ValueWrapper<Vice>
    var thcOrWeed: ValueWrapper<Vice>
    var tobacco: ValueWrapper<Vice>

    enum CodingKeys: String, CodingKey {
        case alcohol
        case psychedelics
        case thcOrWeed = "thc_or_weed"
        case tobacco
    }
}

struct ValueWrapper<T: Codable>: Codable {
    var hidden: Bool
    var value: T
}

struct Neighborhood: Codable {
    var country: String?
    var city: ValueWrapper<String>
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
    var purpose: String?
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
