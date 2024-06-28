//
//  User+Extensions.swift
//  BIPDemo
//
//  Created by Micheal Bingham on 6/27/24.
//

import SwiftUI

extension User {
    static var sampleUser: User {
        return User(
            id: "123456",
            firstName: "Dan",
            birthDate: BirthDate(hidden: false, value: 631152000),
            gender: .man,
            education: Education(hidden: false, degree: .bachelorsDegree, place: "Harvard University"),
            vices: Vices(
                alcohol: ValueWrapper(hidden: false, value: .sometimes),
                psychedelics: ValueWrapper(hidden: false, value: .no),
                thcOrWeed: ValueWrapper(hidden: false, value: .no),
                tobacco: ValueWrapper(hidden: false, value: .no)
            ),
            politicalBeliefs: ValueWrapper(hidden: false, value: .liberal),
            childrenPresence: ValueWrapper(hidden: false, value: .dontHave),
            religiousBeliefs: ValueWrapper(hidden: false, value: .nonReligious),
            familyPlans: ValueWrapper(hidden: false, value: .notSure),
            hometown: ValueWrapper(hidden: false, value: "New York"),
            neighborhood: Neighborhood(country: "USA", city: ValueWrapper(hidden: false, value: "New York"), name: "Manhattan"),
            job: Job(hidden: false, company: "Tech Inc.", title: "Software Engineer"),
            height: ValueWrapper(hidden: false, value: 180),
            ethnicity: ValueWrapper(hidden: false, value: [.white, .hispanic]),
            relationships: ValueWrapper(hidden: false, value: [.longTerm]),
            typeOfRelationship: ValueWrapper(hidden: false, value: "Monogamous"),
            profileComponents: [
                "Dan is a software engineer with a passion for coding.",
                "He enjoys hiking and outdoor adventures.",
                "Dan loves to travel and explore new cultures.",
                "He is an avid reader and enjoys mystery novels.",
                "Dan is also a foodie and loves to try out new recipes."
            ],
            photos: [
                Photo(uid: "photo1", width: 800, index: 0, height: 600, urlString: "https://picsum.photos/seed/photo1/800/600"),
                Photo(uid: "photo2", width: 800, index: 1, height: 600, urlString: "https://picsum.photos/seed/photo2/800/600"),
                Photo(uid: "photo3", width: 800, index: 2, height: 600, urlString: "https://picsum.photos/seed/photo3/800/600"),
                Photo(uid: "photo4", width: 800, index: 3, height: 600, urlString: "https://picsum.photos/seed/photo4/800/600")
            ],
            video: Video(uid: "video1", purpose: "Introduction", width: 1920, height: 1080, urlString: "https://example.com/video.mp4"),
            showInFeed: true,
            isSubscribed: true,
            pets: ["dog": 1, "cat": 1]
        )
    }
    
    /// Returns the age of the user
    func calculateAge() -> Int {
        let birthDate = Date(timeIntervalSince1970: TimeInterval(self.birthDate.value))
        let calendar = Calendar.current
        let ageComponents = calendar.dateComponents([.year], from: birthDate, to: Date())
        return ageComponents.year ?? 0
    }
}




