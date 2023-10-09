//
//  OnboardingView.swift
//  Welfare
//
//  Created by Paola Golombieski Ciarcia on 02/08/23.
//

import SwiftUI

struct OnboardingView: View {
    @AppStorage("onboarding") var isOnboardingViewActive = true
    @State private var buttonWidth = UIScreen.main.bounds.width - 80
    @State private var buttonOffset: CGFloat = 0
    @State private var isAnimating = false
    @State private var imageOffset: CGSize = .zero
    @State private var indicatorOpacity: Double = 1.0
    @State private var title: String = "Share."

    var body: some View {
        ZStack {
            Color.colorBlue
                .edgesIgnoringSafeArea(.all)

            VStack(spacing: 20) {
                Spacer()

                VStack(spacing: 0) {
                    Text(title)
                        .font(.system(size: 60, weight: .heavy))
                        .foregroundColor(.white)
                        .transition(.opacity)

                    Text("It's not how much we give but \nhow much love we put into giving")
                        .font(.title3)
                        .fontWeight(.light)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                }

                .opacity(isAnimating ? 1 : 0)
                .offset(y: isAnimating ? 0 : -40)
                .animation(.easeOut(duration: 1), value: isAnimating)

                ZStack {
                    CircleGroupView(circleColor: .white, opacity: 0.2)
                        .offset(x: imageOffset.width * -1)
                        .blur(radius: abs(imageOffset.width / 5))
                        .scaleEffect(1 + abs(imageOffset.width / 100))
                        .animation(.easeOut(duration: 1), value: imageOffset)

                    Image("character-1")
                        .resizable()
                        .scaledToFit()
                        .opacity(isAnimating ? 1 : 0)
                        .offset(x: imageOffset.width * 1.2, y: 0)
                        .rotationEffect(.degrees(Double(imageOffset.width / 20)))
                        .animation(.easeOut(duration: 0.5), value: isAnimating)
                        .gesture(
                            DragGesture()
                                .onChanged { gesture in
                                    let translatedGesture = gesture.translation
                                    print(imageOffset.width)

                                    if abs(imageOffset.width) <= 150 {
                                        imageOffset = translatedGesture

                                        withAnimation(.linear(duration: 0.25)) {
                                            indicatorOpacity = 0
                                            title = "Give."
                                        }
                                    }
                                }
                                .onEnded { _ in
                                    imageOffset = .zero

                                    withAnimation(.linear(duration: 0.25)) {
                                        indicatorOpacity = 1
                                        title = "Share."
                                    }
                                }
                        )
                        .animation(.easeOut(duration: 1), value: imageOffset)
                }
                .overlay(
                    Image(systemName: "arrow.left.and.right.circle")
                        .font(.system(size: 44, weight: .ultraLight))
                        .foregroundColor(.white)
                        .offset(y: 15)
                        .opacity(isAnimating ? 1 : 0)
                        .opacity(indicatorOpacity)
                        .animation(.easeOut(duration: 1).delay(2), value: isAnimating),
                    alignment: .bottom
                )

                ZStack {
                    Capsule()
                        .fill(Color.white.opacity(0.2))

                    Capsule()
                        .fill(Color.white.opacity(0.2))
                        .padding(8)

                    Text("Get started")
                        .font(.system(.title3, design: .rounded))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .offset(x: 20)

                    HStack {
                        Capsule()
                            .fill(Color.colorRed)
                            .frame(width: buttonOffset + 80)
                        Spacer()
                    }

                    HStack {
                        ZStack {
                            Circle()
                                .fill(Color.colorRed)
                            Circle()
                                .fill(Color.black.opacity(0.15))
                                .padding(8)
                            Image(systemName: "chevron.right.2")
                                .font(.system(size: 24, weight: .bold))
                        }
                        .foregroundColor(.white)
                        .offset(x: buttonOffset)
                        .gesture(
                            DragGesture()
                                .onChanged { gesture in
                                    let translatedGesture = gesture.translation.width
                                    if translatedGesture > 0 && buttonOffset <= buttonWidth - 80 {
                                        buttonOffset = translatedGesture
                                    }
                                }
                                .onEnded { _ in
                                    withAnimation(Animation.easeOut(duration: 0.4)) {
                                        if buttonOffset > buttonWidth / 2 {
                                            playSound(audio: "chimeup", type: "mp3")
                                            isOnboardingViewActive = false
                                        }
                                        buttonOffset = 0

                                    }
                                }
                        )
                        Spacer()
                    }
                }

                .frame(width: buttonWidth, height: 80, alignment: .center)
                .padding()
                .opacity(isAnimating ? 1 : 0)
                .offset(y: isAnimating ? 0 : 40)
                .animation(.easeOut(duration: 1), value: isAnimating)
            }
        }
        .onAppear {
            isAnimating = true
        }
        .preferredColorScheme(.dark)
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
