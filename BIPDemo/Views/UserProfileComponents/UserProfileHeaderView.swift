//
//  UserProfileHeaderView.swift
//  BIPDemo
//
//  Created by Micheal Bingham on 6/27/24.
//

import SwiftUI

struct UserProfileHeaderView: View {
    var name: String
    var age: Int
    
    var body: some View {
        ZStack{
            HStack{
                Image("Butler")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 40, height: 40)
                    .padding(.leading)
                
                MeetUserView(name: name, age: age)
                   
                
          
                Spacer()
                
                Image("settings")
                    .resizable()
                    .frame(width: 35, height: 35)
                    .aspectRatio(contentMode: .fit)
                    .padding()
            }
            
            
        }
    }
}

#Preview {
    UserProfileHeaderView(name: "Micheal", age: 25)
}
