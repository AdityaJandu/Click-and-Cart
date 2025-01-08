//
//  HCard.swift
//  animated-app
//
//  Created by Aditya Jandu on 08/01/25.
//

import SwiftUI

struct HCard: View {
    var section: CourseSection
    var body: some View {
        HStack (spacing: 20){
            VStack(alignment: .leading, spacing: 8) {
                Text(section.title)
                    .customFont(.title2)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text(section.caption)
                    .customFont(.subheadline)
                    .opacity(0.7)
            }
            
            Divider()
            
            section.image
        }
        .padding(30)
        .foregroundColor(.white)
        .frame(maxWidth: .infinity, maxHeight: 100)
        .background(section.color)
        .mask(RoundedRectangle(cornerRadius: 30))
        
    }
}

#Preview {
    HCard(section: courseSections[0])
}
