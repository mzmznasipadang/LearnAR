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
                    HStack {
                        AsyncImage(url: URL(string: "https://pbs.twimg.com/profile_images/1327307759168020480/KKWQDWQF_400x400.jpg"),
                                   content: { image in
                                       image
                                           .resizable()
                                           .scaledToFit()
                                           .frame(width: 100, height: 100)
                                           .clipShape(Circle())
                                   },
                                   placeholder: {
                                       ProgressView()
                                   })

                        VStack(alignment: .leading) {
                            Text(name)
                                .font(.title2)
                                .fontWeight(.medium)
                            Text(email)
                                .font(.title3)
                                .fontWeight(.regular)
                        }
                        Spacer()
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
