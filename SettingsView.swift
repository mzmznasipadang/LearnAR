//
//  SettingsView.swift
//  LearnAR
//
//  Created by Victor Chandra on 03/04/23.
//

import SwiftUI
import Combine

struct SettingsView: View {
    @State private var selectedThemeIndex = 0
    @AppStorage("selectedTheme") private var storedSelectedTheme: Int = 0
    @State private var name = "Victor Chandra"
    @State private var email = "victor.chandra@binus.ac.id"

    var themes = ["Light", "Dark"]

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Profile")) {
                    TextField("Name", text: $name)
                    TextField("Email", text: $email)
                }

                Section(header: Text("Theme")) {
                    Picker("Select a theme", selection: $selectedThemeIndex) {
                        ForEach(0..<themes.count) {
                            Text(self.themes[$0])
                        }
                    }
                    .onAppear {
                        self.selectedThemeIndex = self.storedSelectedTheme
                    }
                }

                Section(header: Text("Privacy")) {
                    NavigationLink(destination: PrivacyView()) {
                        Text("Privacy Settings")
                    }
                }

                Section(header: Text("Account Management")) {
                    NavigationLink(destination: AccountManagementView()) {
                        Text("Manage Account")
                    }
                }

                Section(header: Text("App Version and Updates")) {
                    HStack {
                        Text("App Version")
                        Spacer()
                        Text("1.0 Alpha")
                            .foregroundColor(.gray)
                    }
                }
            }
            .navigationBarTitle("Settings", displayMode: .inline)
            .onChange(of: selectedThemeIndex, perform: { value in
                updateTheme()
            })
        }
    }

    private func updateTheme() {
        self.storedSelectedTheme = selectedThemeIndex
    }
}

struct PrivacyView: View {
    var body: some View {
        Text("Privacy settings will be displayed here.")
            .navigationBarTitle("Privacy Settings", displayMode: .inline)
    }
}

struct AccountManagementView: View {
    var body: some View {
        Text("Account management options will be displayed here.")
            .navigationBarTitle("Account Management", displayMode: .inline)
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
