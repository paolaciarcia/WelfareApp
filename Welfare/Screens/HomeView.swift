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
    var body: some View {
        VStack(spacing: 20) {
            Text("Home")
                .font(.largeTitle)

            Button {
                isOnboardingViewActive = true
            } label: {
                Text("Restart")
            }

        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
