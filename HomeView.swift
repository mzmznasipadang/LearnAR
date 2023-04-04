//  HomeView.swift
//  LearnAR
//
//  Created by Victor Chandra on 03/04/23.
//

import SwiftUI

extension Color {
    static let customBackground = Color("customBackground")
    static let customForeground = Color("customForeground")
}

struct HomeView: View {
    @Environment(\.selectedTheme) private var selectedTheme
    @State private var currentTopic: String? = nil

    var topics = [
        ("Topic 1", "A brief summary of C programming."),
        ("Topic 2", "An introduction to Python."),
        ("Topic 3", "Understanding JavaScript."),
        ("Topic 4", "Introduction to Swift."),
        ("Topic 5", "Exploring Kotlin.")
    ] // The Topics

    var upcomingQuiz = [
        ("Quiz 1", "Topic 1", "Due: 2023-04-10"),
        ("Quiz 2", "Topic 2", "Due: 2023-04-12"),
        ("Quiz 3", "Topic 3", "Due: 2023-04-15"),
    ] // Due Date

    var progressReportData = [
        ("Topic 1", 0.75),
        ("Topic 2", 0.5),
        ("Topic 3", 0.25),
        ("Topic 4", 0.1),
        ("Topic 5", 0.0)
    ] // Progress Report Data

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Text("Home")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                FeaturedTopicView()
                    .padding(.vertical, 5.0)
                RecentlyAccessedView(topics: topics)
                    .padding(.top, 5.0)

                AchievementsView()
            }
            .padding()
        }.navigationTitle("Home")
    }
}

struct FeaturedTopicView: View {
    let featuredTopics = [
        ("Introduction to Swift", "Swift is a powerful and intuitive programming language for iOS, macOS, watchOS, and tvOS."),
        ("Understanding JavaScript", "JavaScript is a lightweight, interpreted, or just-in-time compiled programming language."),
        ("What is Java?", "Java is a versatile, object-oriented programming language. Java remains one of the most widely used programming languages today.")
        // Add more topics here
    ]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Featured Topics")
                .font(.title2)
                .fontWeight(.medium)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 10) {
                    ForEach(featuredTopics, id: \.0) { topic in
                        VStack(alignment: .leading) {
                            Text(topic.0)
                                .font(.headline)
                                .fontWeight(.bold)

                            Text(topic.1)
                                .font(.body)
                        }
                        .padding()
                        .background(Color.customBackground.opacity(0.2))
                        .cornerRadius(15)
                        .frame(width: 350)
                    }
                }
            }
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
                        .background(Color.customBackground.opacity(0.2))
                        .cornerRadius(10)
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
                .background(Color.customBackground.opacity(0.2))
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
                .background(Color.customBackground.opacity(0.2))
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
                .background(Color.customBackground.opacity(0.2))
                .cornerRadius(10)
                
                }
            }.navigationTitle("Home")
        }
    }

struct ProgressReportData {
    let topic: String
    let progress: Double
    
    
}

struct ProgressBar: View {
    var value: Double

    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Rectangle()
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .opacity(0.3)
                    .foregroundColor(Color.customForeground)

                Rectangle()
                    .frame(width: CGFloat(self.value) * geometry.size.width, height: geometry.size.height)
                    .foregroundColor(Color.blue)
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
