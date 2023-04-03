//
//  QuizView.swift
//  LearnAR
//
//  Created by Victor Chandra on 03/04/23.
//

import SwiftUI

struct QuizView: View {
    @State private var currentTopic: String? = nil
    @State private var showAlert = false
    @State private var timeRemaining = 120
    @State private var selectedAnswers: Set<Int> = []
    @State private var textAnswer = ""
    @Environment(\.presentationMode) var presentationMode
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect() //Timer

    var isQuizAnswered: Bool {
        !selectedAnswers.isEmpty && !textAnswer.isEmpty
    }

    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 20) {
                Text("Select Topic")
                    .font(.headline)
                    .fontWeight(.bold)
                
                OptionalTopicSelectionView(currentTopic: $currentTopic)
                    .padding(.bottom)
                
                if currentTopic != nil {
                    Text("Questions for \(currentTopic!)")
                        .font(.headline)
                        .fontWeight(.bold)
                Text("\(timeRemaining / 60) min \(timeRemaining % 60) sec left")
                    .font(.headline)
                    .fontWeight(.bold)
                    .onReceive(timer) { _ in
                    if timeRemaining > 0 {
                    timeRemaining -= 1
                    } else {
                    timer.upstream.connect().cancel()
                    showAlert = true
                     }
                    }

                    // The Question per Topics
                    Group{
                        Text("Question 1: What is C++?")
                            .font(.title3)
                            .fontWeight(.medium)
                        
                        CheckBoxView(label: "C?", id: 1, selectedItems: $selectedAnswers)
                        CheckBoxView(label: "Programming Language", id: 2, selectedItems: $selectedAnswers)
                        CheckBoxView(label: "API", id: 3, selectedItems: $selectedAnswers)
                        CheckBoxView(label: "A Code", id: 4, selectedItems: $selectedAnswers)
                        
                        Text("Question 2: What is React?")
                            .font(.title3)
                            .fontWeight(.medium)
                        
                        TextField("Your answer", text: $textAnswer)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                    }
                    Spacer()

                    Button(action: {
                        showAlert = true
                    }) {
                        Text("Submit")
                            .font(.headline)
                            .fontWeight(.bold)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .foregroundColor(.white)
                            .background(Color.blue)
                            .cornerRadius(10)
                    }
                    .padding(.bottom)
                    .disabled(!isQuizAnswered)
                } else {
                    Spacer()
                }
            }
            .padding()
            .navigationTitle("Quiz")
        }
        .alert(isPresented: $showAlert) {
            Alert(title: Text("Submit Successfully"),
                  message: Text("The teacher will announce the score in class"),
                  dismissButton: .default(Text("OK")) {
                    presentationMode.wrappedValue.dismiss()
                  })
        }
    }
}

struct CheckBoxView: View {
    let label: String
    let id: Int
    @Binding var selectedItems: Set<Int>

    var body: some View {
        Button(action: {
            if selectedItems.contains(id) {
                selectedItems.remove(id)
            } else {
                selectedItems.insert(id)
            }
        }) {
            HStack {
                Image(systemName: selectedItems.contains(id) ? "checkmark.square" : "square")
                Text(label)
            }
        }
        .foregroundColor(.primary)
    }
}

