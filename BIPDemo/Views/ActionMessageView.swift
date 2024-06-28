//
//  ActionMessageView.swift
//  BIPDemo
//
//  Created by Micheal Bingham on 6/27/24.
//

import SwiftUI


struct ActionMessageView: View {
    @Binding var isVisible: Bool
    var action: UserAction

    var body: some View {
        VStack {
            if isVisible {
                Image("Butler")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 100)
                    .transition(.scale)
                    .animation(.easeInOut(duration: 0.5))
                
                Text(action.message)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .padding()
                  
                    .transition(.scale)
                    .animation(.easeInOut(duration: 0.5))
            }
        }
    }
}

enum UserAction {
    case passed
    case requested
    
    var message: String {
        switch self {
        case .passed:
            return "Passed"
        case .requested:
            return "Requested"
        }
    }
}



#Preview {
    ActionMessageView(isVisible: .constant(true), action: .requested)
}
