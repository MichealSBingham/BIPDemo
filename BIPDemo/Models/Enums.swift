//
//  Enums.swift
//  BIPDemo
//
//  Created by Micheal Bingham on 6/27/24.
//

import Foundation



enum Gender: String, Codable {
    case man = "man"
    case woman = "woman"
    case nonbinary = "nobinary"

    var displayTitle: String {
        switch self {
        case .man: return "Man"
        case .woman: return "Woman"
        case .nonbinary: return "Non-binary"
        }
    }
}

enum Status: String, Codable {
    case active = "active"
    case hidden = "hidden"
    case underReview = "underReview"
    case banned = "banned"

    var displayTitle: String {
        switch self {
        case .active: return "Active"
        case .hidden: return "Hidden"
        case .underReview: return "User Review"
        case .banned: return "Banned"
        }
    }
}

enum DatePreference: String, Codable {
    case man = "man"
    case woman = "woman"
    case nonbinaryPeople = "nobinaryPeople"
    case everyone = "everyone"

    var displayTitle: String {
        switch self {
        case .man: return "Men"
        case .woman: return "Women"
        case .nonbinaryPeople: return "Non-binary People"
        case .everyone: return "Everyone"
        }
    }
}

enum Relationship: String, Codable {
    case longTerm = "longTerm"
    case shortTerm = "shortTerm"
    case notToGetMurdered = "notToGetMurdered"

    var displayTitle: String {
        switch self {
        case .longTerm: return "Long term"
        case .shortTerm: return "Short term"
        case .notToGetMurdered: return "Just trying to not get murdered"
        }
    }
}

enum Ethnicity: String, Codable {
    case white = "white"
    case black = "black"
    case hispanic = "hispanic"
    case asian = "asian"
    case middleEastern = "middleEastern"
    case native = "native"
    case pacificIslander = "pacificIslander"
    case other = "other"

    var displayTitle: String {
        switch self {
        case .white: return "White"
        case .black: return "Black/African"
        case .hispanic: return "Hispanic/Latino"
        case .asian: return "Asian"
        case .middleEastern: return "Middle Eastern"
        case .native: return "Native American"
        case .pacificIslander: return "Pacific Islander"
        case .other: return "Other"
        }
    }
}

enum ChildrenPresence: String, Codable {
    case have = "have"
    case dontHave = "dontHave"

    var displayTitle: String {
        switch self {
        case .have: return "Has kids"
        case .dontHave: return "No kids"
        }
    }
}

enum Pet: String, Codable {
    case dog = "dog"
    case cat = "cat"
    case plant = "plant"
    case parrot = "parrot"
    case tiger = "tiger"
    case bunny = "bunny"
    case frog = "frog"
    case hippo = "hippo"
    case snake = "snake"
    case cow = "cow"
    case turtle = "turtle"
    case lizard = "lizard"
    case monkey = "monkey"
    case hedgehog = "hedgehog"
    case squirrel = "squirrel"
    case dove = "dove"
    case horse = "horse"
    case bat = "bat"
    case bug = "bug"
    case zebra = "zebra"
    case flamingo = "flamingo"
    case fungi = "fungi"
    case cactus = "cactus"
    case camel = "camel"
    case stuffedAnimal = "stuffedAnimal"

    var displayTitle: String {
        switch self {
        case .dog: return "Dog 🐶"
        case .cat: return "Cat 🐱"
        case .plant: return "Plant 🌱"
        case .parrot: return "Parrot 🦜"
        case .tiger: return "Tiger 🐅"
        case .bunny: return "Bunny 🐰"
        case .frog: return "Frog 🐸"
        case .hippo: return "Hippo 🦛"
        case .snake: return "Snake 🐍"
        case .cow: return "Cow 🐄"
        case .turtle: return "Turtle 🐢"
        case .lizard: return "Lizard 🦎"
        case .monkey: return "Monkey 🐒"
        case .hedgehog: return "Hedgehog 🦔"
        case .squirrel: return "Squirrel 🐿️"
        case .dove: return "Dove 🕊️"
        case .horse: return "Horse 🐎"
        case .bat: return "Bat 🦇"
        case .bug: return "Bug 🐞"
        case .zebra: return "Zebra 🦓"
        case .flamingo: return "Flamingo 🦩"
        case .fungi: return "Fungi 🍄"
        case .cactus: return "Cactus 🌵"
        case .camel: return "Camel 🐪"
        case .stuffedAnimal: return "Stuffed Animal 🧸"
        }
    }
}

enum FamilyPlans: String, Codable {
    case wantChildren = "wantChildren"
    case dontWantChildren = "dontWantChildren"
    case notSure = "notSure"

    var displayTitle: String {
        switch self {
        case .wantChildren: return "Wants kids"
        case .dontWantChildren: return "Doesn’t want kids"
        case .notSure: return "Not sure yet"
        }
    }
}

enum EducationDegree: String, Codable {
    case learnedFromTikTok = "learnedFromTikTok"
    case highSchoolDegree = "highSchoolDegree"
    case associatesDegree = "associatesDegree"
    case someCollege = "someCollege"
    case bachelorsDegree = "bachelorsDegree"
    case mastersDegree = "mastersDegree"
    case doctorateOrHigher = "doctorateOrHigher"
    case otherPostSecondaryDegree = "otherPostSecondaryDegree"
    case selfTaughtGenius = "selfTaughtGenius"

    var displayTitle: String {
        switch self {
        case .learnedFromTikTok: return "Learned from Tiktok"
        case .highSchoolDegree: return "High school degree"
        case .associatesDegree: return "Associate degree"
        case .someCollege: return "Some College"
        case .bachelorsDegree: return "Bachelor's degree"
        case .mastersDegree: return "Master's Degree"
        case .doctorateOrHigher: return "Doctorate degree"
        case .otherPostSecondaryDegree: return "Other Post-Secondary Degree"
        case .selfTaughtGenius: return "Self-Taught Genius"
        }
    }
}

enum ReligiousBelief: String, Codable {
    case buddhist = "buddhist"
    case crossfitCult = "crossfitCult"
    case christian = "christian"
    case catholic = "catholic"
    case veganism = "veganism"
    case spiritual = "spiritual"
    case jewish = "jewish"
    case muslim = "muslim"
    case hindu = "hindu"
    case nonReligious = "nonReligious"
    case other = "other"
    case preferNotSay = "preferNotSay"

    var displayTitle: String {
        switch self {
        case .buddhist: return "Buddhist"
        case .crossfitCult: return "Crossfit Cult"
        case .christian: return "Christian"
        case .catholic: return "Catholic"
        case .veganism: return "Veganism"
        case .spiritual: return "Spiritual"
        case .jewish: return "Jewish"
        case .muslim: return "Muslim"
        case .hindu: return "Hindu"
        case .nonReligious: return "Not Religious"
        case .other: return "Other"
        case .preferNotSay: return "Prefer not say"
        }
    }
}

enum PoliticalBelief: String, Codable {
    case veryLiberal = "veryLiberal"
    case liberal = "liberal"
    case moderate = "moderate"
    case conservative = "conservative"
    case veryConservative = "veryConservative"
    case nonPolitical = "nonPolitical"
    case independent = "independent"
    case other = "other"
    case preferNotToSay = "preferNotToSay"

    var displayTitle: String {
        switch self {
        case .veryLiberal: return "Communist"
        case .liberal: return "Liberal"
        case .moderate: return "Moderate"
        case .conservative: return "Conservative"
        case .veryConservative: return "Traditional Values"
        case .nonPolitical: return "Non-political"
        case .independent: return "Independent"
        case .other: return "Other"
        case .preferNotToSay: return "Prefer not to say"
        }
    }
}

enum Vice: String, Codable {
    case yes = "yes"
    case sometimes = "sometimes"
    case rarely = "rarely"
    case no = "no"

    var displayTitle: String {
        switch self {
        case .yes: return "Hell yes"
        case .sometimes: return "Socially"
        case .rarely: return "Rarely"
        case .no: return "No"
        }
    }
}
