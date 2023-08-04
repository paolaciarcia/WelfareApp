//
//  CircleGroupView.swift
//  Welfare
//
//  Created by Paola Golombieski Ciarcia on 03/08/23.
//

import SwiftUI

struct CircleGroupView: View {
    @State var circleColor: Color
    @State var opacity: Double
    @State var isAnimating = false

    var body: some View {
        ZStack {
            Circle()
                .stroke(circleColor.opacity(opacity), lineWidth: 40)
                .frame(width: 260, height: 260, alignment: .center)

            Circle()
                .stroke(circleColor.opacity(opacity), lineWidth: 80)
                .frame(width: 260, height: 260, alignment: .center)
        }
        .blur(radius: isAnimating ? 0 : 10)
        .opacity(isAnimating ? 1 : 0)
        .scaleEffect(isAnimating ? 1 : 0.5)
        .animation(.easeOut(duration: 1.0), value: isAnimating)
        .onAppear {
            isAnimating = true
        }
    }
}

struct CircleGroupView_Previews: PreviewProvider {
    static var previews: some View {

        ZStack {
            Color.colorBlue
                .ignoresSafeArea(.all, edges: .all)
            CircleGroupView(circleColor: .white, opacity: 0.2)
        }
    }
}
