//
//  BackgroundView.swift
//  StayFit
//
//  Created by Micheal Bingham on 6/24/24.
//

import SwiftUI

struct BackgroundView: View {
    @StateObject var viewModel: BackgroundViewModel = BackgroundViewModel()
    
    /// Style of gradient animation rotation
    @State var start = UnitPoint.leading
    @State var end = UnitPoint.trailing

    var timer = Timer.publish(every: 2, on: .main, in: .common).autoconnect()

    var body: some View {
        Group {
            if viewModel.isSolidColor {
                viewModel.solidColor.opacity(viewModel.opacity)
            } else {
                LinearGradient(gradient: Gradient(colors: viewModel.colors), startPoint: start, endPoint: end)
                    .opacity(viewModel.opacity)
            }
        }
        .animation(Animation.easeInOut(duration: 2), value: start) /// don't forget the `value`!
        .onReceive(timer) { _ in
            self.start = nextPointFrom(self.start)
            self.end = nextPointFrom(self.end)
        }
        .edgesIgnoringSafeArea(.all)
    }

    /// cycle to the next point
    func nextPointFrom(_ currentPoint: UnitPoint) -> UnitPoint {
        switch currentPoint {
        case .top:
            return .topTrailing
        case .topLeading:
            return .top
        case .leading:
            return .topLeading
        case .bottomLeading:
            return .leading
        case .bottom:
            return .bottomLeading
        case .bottomTrailing:
            return .bottom
        case .trailing:
            return .bottomTrailing
        case .topTrailing:
            return .trailing
        default:
            print("Unknown point")
            return .top
        }
    }
}
 
class BackgroundViewModel: ObservableObject {
    @Published var colors: [Color] = [
            Color(UIColor(red: 85/255, green: 173/255, blue: 139/255, alpha: 1.00)),
            Color(UIColor(red: 67/255, green: 124/255, blue: 186/255, alpha: 1.00))
        ]
    @Published var opacity: Double = 1
    @Published var isSolidColor: Bool = false
    @Published var solidColor: Color = .white
}


#Preview {
    BackgroundView()
}
