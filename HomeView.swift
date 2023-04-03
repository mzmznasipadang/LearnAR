//
//  HomeView.swift
//  LearnAR
//
//  Created by Victor Chandra on 03/04/23.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    Text("Welcome to LearnAR")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    
                    Text("Explore Topics")
                        .font(.title)
                        .fontWeight(.semibold)
                    
                    // Add a horizontal scroll view to showcase the topics
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 20) {
                            // Replace the Text views with your topic cards or custom views
                            Text("Topic 1")
                            Text("Topic 2")
                            Text("Topic 3")
                            Text("Topic 4")
                        }
                        .padding()
                    }
                    
                    Text("Quizzes")
                        .font(.title)
                        .fontWeight(.semibold)
                    
                    VStack(alignment: .leading, spacing: 10) {
                        // Add quiz cards or custom views for each quiz
                        Text("Quiz 1")
                        Text("Quiz 2")
                        Text("Quiz 3")
                    }
                }
                .padding()
            }
            .navigationTitle("Home")
        }
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
