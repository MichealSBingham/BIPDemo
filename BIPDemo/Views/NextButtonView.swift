//
//  EnterNameView.swift
//  StayFit
//
//  Created by Micheal Bingham on 6/23/24.
//

import SwiftUI

struct NextButtonView: View {
    var action: () -> Void
    var text: String = "Next"
    
    
    var body: some View {
        Button(action: {
            self.action()
        }) {
            Text(.init(text))
                       .font(.headline)
                       .foregroundColor(.white)
                       .frame(maxWidth: .infinity)
                       .background(Color(hex: "F74844"))
                       .clipShape(Capsule())
                       .lineLimit(1)
                       .minimumScaleFactor(0.1)
                       .padding()
                       
                     
        }
        
    }
}


#Preview {
    NextButtonView{
        
    }
    .preferredColorScheme(.dark)
}
