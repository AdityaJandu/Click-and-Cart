//
//  OnboardingView.swift
//  animated-app
//
//  Created by Aditya Jandu on 07/01/25.
//

import SwiftUI
import RiveRuntime

struct OnboardingView: View {
    // Dealing With Animated Button:
    let button = RiveViewModel(fileName: "button")
    @State var showModal = false
    
    var body: some View {
        ZStack {
            background
            
            content
                .offset(y : showModal ? -50 : 0)
            
            Color("Shadow")
                .opacity(showModal ? 0.3 : 0)
                .ignoresSafeArea()
            
            if showModal{
                SignInView()
                    .transition(.move(edge: .bottom).combined(with: .opacity))
                    .overlay(
                        Button {
                            withAnimation(.spring()){
                                showModal = false
                            }
                        } label: {
                            Image(systemName: "xmark")
                                .frame(width: 36, height: 36)
                                .foregroundColor(.black)
                                .background(.white)
                                .mask(Circle())
                                .shadow(color: Color("Shadow").opacity(0.5),
                                    radius: 30,x: 0,y: 3)
                        }
                            .frame(maxHeight: .infinity,
                                   alignment: .bottom)
                )
                    .zIndex(1)
            }
            
        }
    }
    
    // Entire content of foreground screen:
    var content : some View{
        VStack(alignment: .leading, spacing: 16) {
            Text("Click & Cart")
                .font(.custom("Poppins Bold", size: 60, relativeTo: .largeTitle))
                .frame(width: 260,alignment: .leading)
            
            Text("We're thrilled to have you join our community. With our app, you'll discover a world of products, enjoy tailored recommendations, and experience a smooth, secure shopping journey. Let's get started and make your shopping experience effortless!")
                .customFont(.body)
                .opacity(0.7)
            
            Spacer()
            
            button.view()
                .frame(width: 236, height: 64)
                .overlay(
                    Label("Start Now", systemImage: "arrow.forward")
                        .offset(x: 4, y: 4)
                        .font(.headline)
                )
                .background(
                    Color.black
                        .cornerRadius(30)
                        .blur(radius: 10)
                        .opacity(0.3)
                        .offset(y: 10)
                )
                .onTapGesture {
                    button.play(animationName: "active")
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.8, execute: {
                        withAnimation(
                            .spring()){
                                showModal = true
                            }
                    })
            }
            
            Text("By signing up, you agree to our [Terms & Conditions] and [Privacy Policy]. Your privacy and security are our top priority!")
                .customFont(.footnote)
                .opacity(0.7)
            
        }
        .padding(40)
        .padding(.top, 40)
    }
    
    
    // Back Ground Stuff Here:
    var background : some View {
            RiveViewModel(fileName: "shapes").view()
                .ignoresSafeArea()
                .blur(radius: 10)
                .background(
                    Image("Spline")
                        .blur(radius: 30)
                        .offset(x: 200, y: 50)
            )
    }
}

#Preview {
    OnboardingView()
}
