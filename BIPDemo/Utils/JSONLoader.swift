//
//  JSONLoader.swift
//  BIPDemo
//
//  Created by Micheal Bingham on 6/27/24.
//

import Foundation


class JSONLoader {
    static func load<T: Decodable>(_ filename: String, as type: T.Type) -> T {
        guard let file = Bundle.main.url(forResource: filename, withExtension: "json") else {
            fatalError("Couldn't find \(filename) in main bundle.")
        }

        do {
            let data = try Data(contentsOf: file)
            let decoder = JSONDecoder()
            return try decoder.decode(T.self, from: data)
        } catch {
            print("Error: \(error)")
            fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
        }
    }
}
