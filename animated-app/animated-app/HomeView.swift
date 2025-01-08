//
//  HomeView.swift
//  animated-app
//
//  Created by Aditya Jandu on 08/01/25.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack {
            Color("Background")
                .ignoresSafeArea()
            ScrollView {
                content
            }
        }
    }
    
    var content: some View{
        VStack(alignment: .leading,spacing: 0) {
            Text("Courses")
                .customFont(.largeTitle)
                .frame(maxWidth: .infinity ,alignment: .leading)
                .padding(.leading, 20)
            
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20) {
                    Spacer(minLength: 1)
                    ForEach(courses) { course in
                            VCard(course: course)
                    }
                }
            }
            .padding(.bottom, 20)
            
            Text("Recents")
                .customFont(.title3)
                .padding(.horizontal, 30)
            
            
                VStack {
                    ForEach(courseSections) { section in
                        HCard(section: section)
                    }
                }
                .padding(20)
                .ignoresSafeArea()
        }
    }
}

#Preview {
    HomeView()
}
