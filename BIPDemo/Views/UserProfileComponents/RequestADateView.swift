//
//  RequestADateView.swift
//  BIPDemo
//
//  Created by Micheal Bingham on 6/27/24.
//

import SwiftUI


struct RequestADateView: View {
    var body: some View {
        Text("Request A Date")
            .font(.headline)
            .lineLimit(1)
            .minimumScaleFactor(0.1)
            .fontWeight(.bold)
            .foregroundColor(.white)
            .padding()
            .frame(width: 176)
            .background(Color(hex: "F74844"))
            .cornerRadius(25)
            
    }
}

#Preview {
    RequestADateView()
}
