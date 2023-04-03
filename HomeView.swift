//
//  HomeView.swift
//  LearnAR
//
//  Created by Victor Chandra on 03/04/23.
//

import SwiftUI

struct HomeView: View {
    @State private var currentTopic: String? = nil

        var topics = [
            ("Topic 1", "A brief summary of C programming."),
            ("Topic 2", "An introduction to Python."),
            ("Topic 3", "Understanding JavaScript."),
            ("Topic 4", "Introduction to Swift."),
            ("Topic 5", "Exploring Kotlin.")
        ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    Text("Welcome to LearnAR")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    
                    Text("Explore Topics")
                        .font(.headline)
                        .fontWeight(.medium)
                    ForEach(topics, id: \.0) { topic, summary in
                        VStack(alignment: .leading) {
                            Text(topic)
                                .font(.headline)
                                .fontWeight(.bold)
                            Text(summary)
                                .font(.body)
                        }
                        .padding()
                        .background(Color.blue.opacity(0.1))
                        .cornerRadius(20)
                        .onTapGesture {
                            currentTopic = topic
                        }
                    }.padding(.top, 5.0)
                    
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
