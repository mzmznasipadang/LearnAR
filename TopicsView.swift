//
//  TopicsView.swift
//  LearnAR
//
//  Created by Victor Chandra on 03/04/23.
//

import SwiftUI

struct TopicsView: View {
    var topics = [
        "Topic 1: Introduction to C",
        "Topic 2: Basics of Python",
        "Topic 3: Getting Started with JavaScript",
        "Topic 4: Swift for Beginners",
        "Topic 5: Exploring Kotlin"
    ]

    var body: some View {
        NavigationView {
            List(topics, id: \.self) { topic in
                VStack(alignment: .leading, spacing: 8) {
                    Text(topic)
                        .font(.headline)
                        .fontWeight(.regular)
                }
            }
            .navigationTitle("Topics")
        }
    }
}

struct TopicsView_Previews: PreviewProvider {
    static var previews: some View {
        TopicsView()
    }
}

