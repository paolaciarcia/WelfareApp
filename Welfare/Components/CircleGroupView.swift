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

    var body: some View {
        ZStack {
            Circle()
                .stroke(circleColor.opacity(opacity), lineWidth: 40)
                .frame(width: 260, height: 260, alignment: .center)

            Circle()
                .stroke(circleColor.opacity(opacity), lineWidth: 80)
                .frame(width: 260, height: 260, alignment: .center)
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
