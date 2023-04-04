import SwiftUI

struct ContentView: View {
    @State private var isSplashShowing = true
    @State private var selectedTab: Int = 0
    
    var body: some View {
        ZStack {
            TabView(selection: $selectedTab) {
                HomeView()
                    .tabItem {
                        if selectedTab == 0 {
                            Label("Home", systemImage: "house.fill")
                        } else {
                            Label("Home", systemImage: "house")
                        }
                    }
                    .tag(0)
                    .animation(.easeInOut(duration: 1), value: selectedTab)

                QuizView()
                    .tabItem {
                        if selectedTab == 1 {
                            Label("Quiz", systemImage: "book.fill")
                        } else {
                            Label("Quiz", systemImage: "text.book.closed.fill")
                        }
                    }
                    .tag(1)
                    .animation(.easeInOut(duration: 1), value: selectedTab)

                TopicsView()
                    .tabItem {
                        if selectedTab == 2 {
                            Label("Topics", systemImage: "checkmark.message.fill")
                        } else {
                            Label("Topics", systemImage: "message.badge.filled.fill")
                        }
                    }
                    .tag(2)
                    .animation(.easeInOut(duration: 1), value: selectedTab)

                SettingsView()
                    .tabItem {
                        if selectedTab == 3 {
                            Label("Settings", systemImage: "gear.badge")
                        } else {
                            Label("Settings", systemImage: "gear")
                        }
                    }
                    .tag(3)
                    .animation(.easeInOut(duration: 1), value: selectedTab)
            }
            
            SplashView(isShowing: $isSplashShowing)
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                withAnimation(.easeInOut(duration: 1)) {
                    isSplashShowing = false
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
