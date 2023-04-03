//
//  HomeView.swift
//  LearnAR
//
//  Created by Victor Chandra on 03/04/23.
//

import SwiftUI

struct HomeView: View {
    @State private var currentTopic: String? = nil
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
                    
                // Topic selection view
                OptionalTopicSelectionView(currentTopic: $currentTopic)
                    .padding(5)
                                
                HStack {
                    if let topic = currentTopic {
                    Text("Current Topic: \(topic)")
                        .font(.headline)
                        .fontWeight(.bold)
                        } else {
                        Text("Please select a topic")
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundColor(.red)
                            }
                            Spacer()
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
