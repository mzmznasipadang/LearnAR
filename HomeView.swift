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
    ] //The Topics
    var upcomingQuiz = [
            ("Quiz 1", "Topic 1", "Due: 2023-04-10"),
            ("Quiz 2", "Topic 2", "Due: 2023-04-12"),
            ("Quiz 3", "Topic 3", "Due: 2023-04-15"),
    ] // Due Date

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Text("Home")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                FeaturedTopicView()
                
                RecentlyAccessedView(topics: topics)
                    .padding(.top, 20.0)

                AchievementsView()
            }
            .padding()
        }
    }
}

struct FeaturedTopicView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Featured Topic")
                .font(.headline)
                .fontWeight(.medium)

            VStack(alignment: .leading) {
                Text("Introduction to Swift")
                    .font(.headline)
                    .fontWeight(.bold)

                Text("Swift is a powerful and intuitive programming language for iOS, macOS, watchOS, and tvOS. Writing Swift code is interactive and fun, the syntax is concise yet expressive, and Swift includes modern features developers love.")
                    .font(.body)
            }
            .padding()
            .background(Color.blue.opacity(0.1))
            .cornerRadius(10)
        }
    }
}

struct RecentlyAccessedView: View {
    let topics: [(String, String)]

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Explore The Topics")
                .font(.title2)
                .fontWeight(.bold)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 10) {
                    ForEach(topics, id: \.0) { topic in
                        VStack(alignment: .leading, spacing: 5) {
                            Text(topic.0)
                                .font(.headline)
                                .fontWeight(.bold)

                            Text(topic.1)
                                .font(.subheadline)
                        }
                        .padding()
                        .background(Color.blue.opacity(0.1))
                        .cornerRadius(10)
//                        // Upcoming Quizzes
//                        VStack(alignment: .leading, spacing: 10) {
//                        Text("Upcoming Quizzes")
//                        .font(.title2)
//                        .fontWeight(.bold)
//                        VStack(alignment: .leading, spacing: 5) {
//                        ForEach(upcomingQuiz, id: \.0) { quiz in
//                        VStack(alignment: .leading, spacing: 5) {
//                        Text(quiz.0)
//                         .font(.headline)
//                        .fontWeight(.bold)
//                            Text(quiz.1)
//                        .font(.subheadline)
//                            Text(quiz.2)
//                         .font(.footnote)
//                        .foregroundColor(.gray)
//                                    }
//                                    }
//                                }
//                            }
                        }
                    }
                }
            }
        }
    }
struct AchievementsView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Achievements")
                .font(.headline)
                .fontWeight(.medium)
            
            HStack {
                VStack {
                    Image(systemName: "star.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50)
                        .foregroundColor(.yellow)
                    
                    Text("Badge 1")
                        .font(.body)
                        .fontWeight(.semibold)
                }
                .padding()
                .background(Color.blue.opacity(0.1))
                .cornerRadius(10)
                
                VStack {
                    Image(systemName: "star.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50)
                        .foregroundColor(.yellow)
                    
                    Text("Badge 2")
                        .font(.body)
                        .fontWeight(.semibold)
                }
                .padding()
                .background(Color.blue.opacity(0.1))
                .cornerRadius(10)
                
                VStack {
                    Image(systemName: "star.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50)
                        .foregroundColor(.yellow)
                    
                    Text("Badge 3")
                        .font(.body)
                        .fontWeight(.semibold)
                }
                .padding()
                .background(Color.blue.opacity(0.1))
                .cornerRadius(10)
                }
            }
        }
    }
//struct ProgressView: View {
//    var body: some View {
//        // Progress Report
//        VStack(alignment: .leading, spacing: 10) {
//            Text("Progress Report")
//                .font(.title2)
//                .fontWeight(.bold)
//
//            // Display progress report here
//        }
//    }
//}

    struct HomeView_Previews: PreviewProvider {
        static var previews: some View {
            HomeView()
        }
    }
