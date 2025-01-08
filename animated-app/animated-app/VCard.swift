//
//  VCard.swift
//  animated-app
//
//  Created by Aditya Jandu on 08/01/25.
//

import SwiftUI

struct VCard: View {
    var course : Course
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(course.title)
                .customFont(.title2)
                .frame(maxWidth: 170,alignment: .leading)
                .layoutPriority(1)
            Text(course.subtitle)
                .customFont(.subheadline)
                .frame(maxWidth: .infinity, alignment: .leading)
                .opacity(0.7)
            Text(course.caption.uppercased())
                .customFont(.footnote2)
            Spacer()
            HStack {
                ForEach(Array([4, 5, 6].shuffled().enumerated()), id: \.offset) { index, number in
                    Image("Avatar \(number)")
                        .resizable()
                        .frame(width: 66 ,height: 66)
                        .mask(Circle())
                        .offset(x: CGFloat(index * -20))
                }
            }
        }
        .padding(30)
        .frame(width: 260,height: 310)
        .background(LinearGradient(colors: [course.color, course.color.opacity(0.5)], startPoint: .topLeading, endPoint: .bottomTrailing))
        .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
        .shadow(color: course.color.opacity(0.3), radius: 20, x: 0,y: 12)
        .foregroundColor(.white)
        .overlay(
            course.image
                .frame(maxWidth: .infinity ,maxHeight: .infinity, alignment: .topTrailing)
                .padding(20)
        )
        
    }
}

#Preview {
    VCard(course: courses[0])
}
