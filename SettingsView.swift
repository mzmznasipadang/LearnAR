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
    @State private var name = "John Doe"
    @State private var email = "johndoe@example.com"

    var themes = ["Light", "Dark"]

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Profile")) {
                    VStack {
                        HStack {
                            Spacer()
                            Circle()
                                .frame(width: 50, height: 50)
                                .foregroundColor(.gray)
                                .overlay(
                                    Text("👤")
                                        .font(.system(size: 25))
                                        .foregroundColor(.white)
                                )
                            Spacer()
                        }
                        TextField("Name", text: $name)
                        TextField("Email", text: $email)
                    }
                }

                Section(header: Text("Theme")) {
                    Picker("Select a theme", selection: $selectedThemeIndex) {
                        ForEach(0..<themes.count, id: \.self) { index in
                            Text(self.themes[index])
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
                        Text("1.0 Beta")
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
                @State private var locationServiceEnabled = false
                @State private var analyticsEnabled = true
                @State private var personalizedAdsEnabled = true
                
                var body: some View {
                    List {
                        Section(header: Text("Personal Information")) {
                            NavigationLink(destination: EditPersonalInformationView()) {
                                Text("Edit Personal Information")
                            }
                        }
                        
                        Section(header: Text("Location Services")) {
                            Toggle(isOn: $locationServiceEnabled) {
                                Text("Enable Location Services")
                            }
                        }
                        
                        Section(header: Text("Analytics")) {
                            Toggle(isOn: $analyticsEnabled) {
                                Text("Share Analytics Data")
                            }
                        }
                        
                        Section(header: Text("Advertising")) {
                            Toggle(isOn: $personalizedAdsEnabled) {
                                Text("Personalized Ads")
                            }
                        }
                    }
                    .listStyle(GroupedListStyle())
                    .navigationTitle("Privacy Settings")
                }
            }
            
            struct EditPersonalInformationView: View {
                var body: some View {
                    List {
                        Section(header: Text("Personal Information")) {
                            NavigationLink(destination: Text("Edit Full Name")) {
                                Text("Full Name")
                            }
                            
                            NavigationLink(destination: Text("Edit Email Address")) {
                                Text("Email Address")
                            }
                            
                            NavigationLink(destination: Text("Edit Phone Number")) {
                                Text("Phone Number")
                            }
                            
                            NavigationLink(destination: Text("Edit Date of Birth")) {
                                Text("Date of Birth")
                            }
                            
                            NavigationLink(destination: Text("Change Password")) {
                                Text("Change Password")
                            }
                        }
                    }
                    .listStyle(GroupedListStyle())
                    .navigationTitle("Edit Personal Information")
                }
            }
            
            struct PrivacyView_Previews: PreviewProvider {
                static var previews: some View {
                    PrivacyView()
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
