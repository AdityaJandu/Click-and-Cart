//
//  CustomTextField.swift
//  animated-app
//
//  Created by Aditya Jandu on 07/01/25.
//

import SwiftUI

struct CustomTextField : ViewModifier{
    var image : Image
    
    func body(content: Content) -> some View {
        content
            .padding(15)
            .padding(.leading, 46)
            .background(.white)
            .mask(RoundedRectangle(cornerRadius: 20))
            .overlay(RoundedRectangle(cornerRadius: 20)
                .stroke()
                .fill(.black.opacity(0.2)))
            .overlay(
                image
                .frame( maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 15)
            )
    }
}

extension View {
    func customTextField(_ image: Image) -> some View{
        modifier(CustomTextField(image: image))
    }
}
