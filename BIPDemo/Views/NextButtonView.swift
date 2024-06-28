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
                       .foregroundColor(Color(UIColor(red: 67/255, green: 124/255, blue: 186/255, alpha: 1.00)))
                       .padding()
                       .frame(maxWidth: .infinity)
                       .background(Color.white)
                       .clipShape(Capsule())
                       .padding(.horizontal)
        }
        
    }
}


#Preview {
    NextButtonView{
        
    }
    .preferredColorScheme(.dark)
}
