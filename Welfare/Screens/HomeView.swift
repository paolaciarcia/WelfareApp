//
//  HomeView.swift
//  Welfare
//
//  Created by Paola Golombieski Ciarcia on 02/08/23.
//

import SwiftUI

struct HomeView: View {
    //UserDefaults and UserDefaults key
    @AppStorage("onboarding") var isOnboardingViewActive = false
    @State var isAnimating = false

    var body: some View {
        VStack {
            Spacer()
            VStack(spacing: 35) {
                ZStack {
                    CircleGroupView(circleColor: .gray, opacity: 0.1)

                    Image("character-2")
                        .resizable()
                        .scaledToFit()
                        .offset(y: isAnimating ? 35 : -35)
                        .animation(.easeInOut(duration: 4).repeatForever(),
                                   value: isAnimating)
                }

                Text("The time that leads to mastery is \ndependent on the intensity of our focus")
                    .multilineTextAlignment(.center)
                    .font(.title3)
                    .fontWeight(.light)
                    .foregroundColor(.gray.opacity(0.8))
            }

            Spacer()

            Button {
                isOnboardingViewActive = true
            } label: {
                Image(systemName: "arrow.2.circlepath.circle.fill")
                    .imageScale(.large)

                Text("Restart")
                    .font(.system(.title3, design: .rounded))
                    .fontWeight(.bold)
            }
            .buttonStyle(.borderedProminent)
            .buttonBorderShape(.capsule)
            .controlSize(.large)
        }
        .padding()
        .onAppear {
            isAnimating = true
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
