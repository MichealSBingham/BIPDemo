//
//  MeetUserView.swift
//  BIPDemo
//
//  Created by Micheal Bingham on 6/27/24.
//

import SwiftUI

struct MeetUserView: View {
    var name: String
    var age: Int
    
    @State private var isVisible = false

    var body: some View {
        Text("Meet \(name), \(age)")
            //.font(.custom("SF Pro Display", size: 24))
            .font(.title)
            .fontWeight(.black)
            .foregroundColor(.white)
            .padding()
            .background(Color(hex: "F74844"))
            .cornerRadius(10)
            .opacity(isVisible ? 1 : 0)
            .lineLimit(1)
            .minimumScaleFactor(0.1)
            .onAppear {
                withAnimation(Animation.easeInOut(duration: 1.0)) {
                    isVisible = true
                }
            }
    }
}




#Preview {
    MeetUserView(name: "Micheal", age: 25)
}
