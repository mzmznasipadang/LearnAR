//
//  TopicSelectionView.swift
//  LearnAR
//
//  Created by Victor Chandra on 03/04/23.
//

import SwiftUI

struct TopicSelectionView: View {
    @Binding var currentTopic: String?

    var body: some View {
        VStack(alignment: .leading) {
            Text("Select a topic:")
                .font(.headline)
                .fontWeight(.bold)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20) {
                    ForEach(1...5, id: \.self) { index in
                        Text("Topic \(index)")
                            .padding()
                            .background(currentTopic == "Topic \(index)" ? Color.blue : Color.gray)
                            .foregroundColor(.white)
                            .cornerRadius(15)
                            .onTapGesture {
                                currentTopic = "Topic \(index)"
                            }
                    }
                }
                .padding(.horizontal)
            }
        }
    }
}
