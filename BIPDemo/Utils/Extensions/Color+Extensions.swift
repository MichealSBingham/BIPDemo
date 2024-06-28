//
//  Color.swift
//  BIPDemo
//
//  Created by Micheal Bingham on 6/27/24.
//

import Foundation
import SwiftUI

///Extension to get a color based on HEX value
extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        scanner.scanLocation = 0
        
        var rgbValue: UInt64 = 0
        scanner.scanHexInt64(&rgbValue)
        
        let red = Double((rgbValue & 0xff0000) >> 16) / 255.0
        let green = Double((rgbValue & 0xff00) >> 8) / 255.0
        let blue = Double(rgbValue & 0xff) / 255.0
        
        self.init(red: red, green: green, blue: blue)
    }
}
