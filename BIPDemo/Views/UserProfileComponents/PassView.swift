//
//  PassView.swift
//  BIPDemo
//
//  Created by Micheal Bingham on 6/27/24.
//

import SwiftUI

struct PassView: View {
    var body: some View {
        Text("Pass")
            .font(.headline)
            .fontWeight(.bold)
            .foregroundColor(.white)
            .padding()
            .frame(width: 93)
            .background(Color(hex: "20293A"))
            .cornerRadius(25)
            
    }
}

#Preview {
    PassView()
}
