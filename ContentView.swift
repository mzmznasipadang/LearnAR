import SwiftUI

struct ContentView: View {
    @State private var isSplashShowing = true
    @State private var selectedTab: Int = 0
    
    var body: some View {
        ZStack {
            TabView(selection: $selectedTab) {
                HomeView()
                    .tabItem {
                        if selectedTab == 1{
                            Label("Home", systemImage: "house")
                        } else {
                            Label("Home", systemImage: "house.fill")
                        }
                    }
                    .tag(0)

                QuizView()
                    .tabItem {
                        if selectedTab == 2 {
                            Label("Quiz", systemImage: "book.fill")
                        } else {
                            Label("Quiz", systemImage: "text.book.closed.fill")
                        }
                    }
                    .tag(2)
                
                TopicsView()
                    .tabItem {
                        if selectedTab == 3{
                            Label("Topics", systemImage: "checkmark.message.fill")
                        } else {
                            Label("Topics", systemImage: "message.badge.filled.fill")
                        }
                    }
                    .tag(3)

                SettingsView()
                    .tabItem {
                    if selectedTab == 4{
                    Label("Settings", systemImage: "gear.badge")
                    } else {
                    Label("Settings", systemImage: "gear")
                            }
                        }
                    .tag(4)
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
