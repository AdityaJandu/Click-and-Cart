//
//  SignInView.swift
//  animated-app
//
//  Created by Aditya Jandu on 07/01/25.
//

import SwiftUI
import RiveRuntime

struct SignInView: View {
    @State var email = ""
    @State var password = ""
    @State var isLoading = false
    @Binding var showModal: Bool
    let check = RiveViewModel(fileName: "check", stateMachineName: "State Machine 1")
    let confetti = RiveViewModel(fileName: "confetti", stateMachineName: "State Machine 1")
    
    func logIn(){
        isLoading = true
        
        if email != "" && password != ""{
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0, execute: {
                check.triggerInput("Check")
            })
            DispatchQueue.main.asyncAfter(deadline: .now() + 3.0, execute: {
                isLoading = false
                confetti.triggerInput("Trigger explosion")
            })
            DispatchQueue.main.asyncAfter(deadline: .now() + 4.0, execute: {
                withAnimation {
                    showModal = false
                }
            })
        }
        else{
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0, execute: {
                check.triggerInput("Error")
            })
            DispatchQueue.main.asyncAfter(deadline: .now() + 3.0, execute: {
                isLoading = false
            })
        }
        
        
    }
    
    var body: some View {
        VStack(spacing: 24) {
            Text("Sign In")
                .customFont(.largeTitle)
            
            Text("Welcome to Click and Cart—your fast and smart shopping solution. Discover, select, and check out in seconds.")
                .customFont(.headline)
            
            VStack(alignment: .leading){
                Text("Sign In")
                    .customFont(.subheadline2)
                    .foregroundColor(.secondary)
                
                TextField("", text: $email)
                    .customTextField(Image("Icon Email"))
            }
            
            VStack(alignment: .leading){
                Text("Password")
                    .customFont(.subheadline2)
                    .foregroundColor(.secondary)
                
                SecureField("", text: $password)
                    .customTextField(Image("Icon Lock"))
            }
            
            Button{
                logIn()
            } label: {
                Label("Sign In",systemImage: "arrow.right")
                    .padding(20)
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                    .background(Color(hex: "F77D8E"))
                    .foregroundColor(.white)
                    .customFont(.headline)
                    .clipShape(
                        .rect(
                            topLeadingRadius: 8,
                            bottomLeadingRadius: 20,
                            bottomTrailingRadius: 20,
                            topTrailingRadius: 20
                        )
                    )
                .shadow(color: Color(hex:"F77D8E"), radius: 20, x: 0, y: 10)
            }
            
            HStack {
                Rectangle()
                    .frame(height: 1)
                    .opacity(0.3)
                Text("OR")
                    .customFont(.subheadline2)
                    .foregroundColor(.secondary)
                    .padding(.horizontal,10)
                Rectangle()
                    .frame(height: 1)
                    .opacity(0.3)
            }
            
            Text("Sign Up with e-Mail, Apple and Google")
                .font(.subheadline)
                .foregroundColor(.secondary)
            
            HStack{
                Image("Logo Email")
                Spacer()
                Image("Logo Apple")
                Spacer()
                Image("Logo Google")
            }
        }
        .padding(30)
        .background(.regularMaterial)
        .mask(RoundedRectangle(cornerRadius: 20))
        .shadow(color: Color("Shadow").opacity(0.5),radius: 5,x: 0,y: 3)
        .shadow(color: Color("Shadow").opacity(0.5),radius: 30,x: 0,y: 30)
        .overlay(RoundedRectangle(cornerRadius: 20)
            .stroke(.linearGradient(colors: [.white.opacity(0.8),.white.opacity(0.1)], startPoint: .topLeading, endPoint: .bottomTrailing)))
        .padding()
        .overlay(
            ZStack {
                if isLoading {
                    check.view()
                        .frame(width: 150,height: 150)
                        .allowsHitTesting(false)
                }
                confetti.view()
                    .scaleEffect(3)
                    .allowsHitTesting(false)
            }
        )
        
    }
}

#Preview {
    SignInView(showModal: .constant(true))
}
