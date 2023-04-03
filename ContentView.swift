import SwiftUI

struct ContentView: View {
    @State private var isSplashShowing = true
    
    var body: some View {
        ZStack {
            TabView {
                HomeView()
                    .tabItem {
                        Label("Home", systemImage: "house")
                    }
                QuizView()
                    .tabItem {
                        Label("Quiz", systemImage: "book")
                    }
                TopicsView()
                    .tabItem {
                        Label("Topics", systemImage: "info.bubble.fill")
                    }
                SettingsView()
                    .tabItem {
                        Label("Settings", systemImage: "gear.circle.fill")
                    }
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
