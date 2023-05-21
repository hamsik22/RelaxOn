//
//  OnboardingView.swift
//  RelaxOn
//
//  Created by Doyeon on 2023/05/18.
//

import SwiftUI

struct OnboardingView: View {
    
    var onboardingImages = ["1-dark", "2-dark", "3-dark", "4-dark"]
    @State var currentStep = 0
    
    var body: some View {
        
        ZStack(alignment: .bottom) {
            TabView(selection: $currentStep) {
                ForEach(0..<4) { num in
                    Image(onboardingImages[num])
                        .resizable()
                        .frame(maxWidth: .infinity)
                        .ignoresSafeArea()
                }
            }.tabViewStyle(.page(indexDisplayMode: .never))
            
            Button {
                if currentStep < onboardingImages.count - 1 { self.currentStep += 1
                    print(currentStep)
                } else {
                    // TODO: TutorialView로 이동
                }
            } label: {
                Text(currentStep == onboardingImages.count - 1 ? "시작하기" : "계속")
                    .padding(12)
                    .frame(maxWidth: .infinity)
                    .foregroundColor(.white)
                    .bold()
                    .background(Color.purple)
                    .cornerRadius(15)
                    .padding(30)
                
            }
        }.ignoresSafeArea()
    }
}
struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
