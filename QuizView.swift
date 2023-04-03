//
//  QuizView.swift
//  LearnAR
//
//  Created by Victor Chandra on 03/04/23.
//

import SwiftUI

import SwiftUI

struct QuizView: View {
    @State private var currentTopic: String? = nil
    @State private var timeRemaining = 120 //in Seconds
    @State private var showAlert = false
    @State private var selectedAnswers: Set<Int> = []
    @State private var textAnswer = ""
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State private var startTimer = false

    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 20) {
                // Topic selection view
                TopicSelectionView(currentTopic: $currentTopic)
                    .padding(.top, 20)
                    .onChange(of: currentTopic) { _ in
                        startTimer = true
                    }
                
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
                    
                    if startTimer {
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
                    }
                }
                
                Group {
                    // Quiz content
                    Text("Question 1: Which of these animals are mammals?")
                        .font(.title2)
                        .fontWeight(.bold)
                    
                    CheckBoxView(label: "Cat", id: 1, selectedItems: $selectedAnswers)
                    CheckBoxView(label: "Shark", id: 2, selectedItems: $selectedAnswers)
                    CheckBoxView(label: "Dolphin", id: 3, selectedItems: $selectedAnswers)
                    CheckBoxView(label: "Eagle", id: 4, selectedItems: $selectedAnswers)
                    
                    Text("Question 2: What is the capital of France?")
                        .font(.title2)
                        .fontWeight(.bold)
                    
                    TextField("Your answer", text: $textAnswer)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                
                Spacer()
                
                Button(action: {
                    // Handle submit action
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
            }
            .padding()
            .navigationTitle("Quiz")
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Quiz Over"), message: Text("The quiz has ended."), dismissButton: .default(Text("OK")))
            }
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

