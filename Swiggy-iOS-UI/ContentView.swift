import SwiftUI

struct ContentView: View {
    @State private var selectedTab = 0
    @State private var isTabBarVisible = true // State to control tab bar visibility

    var body: some View {
        TabView(selection: $selectedTab) {
            
            // Home Tab
            NavigationView {
                HomeView()
            }
            .tabItem {
                Image(systemName: "house.fill")
                Text("Home")
            }
            .tag(0)
            
            // Food Tab
            NavigationView {
                Text("Food Content")
            }
            .tabItem {
                Image(systemName: "fork.knife")
                Text("Food")
            }
            .tag(1)
            
            // Eatlists Tab
            NavigationView {
                Text("Eatlists Content")
            }
            .tabItem {
                Image(systemName: "list.bullet")
                Text("Eatlists")
            }
            .tag(2)
            
            // Bolt Tab
            NavigationView {
                Text("Bolt Content")
            }
            .tabItem {
                Image(systemName: "bolt.fill")
                Text("Bolt")
            }
            .tag(3)
            
            // Card Tab
            NavigationView {
                Text("Card Content")
            }
            .tabItem {
                Image(systemName: "creditcard.fill")
                Text("Card")
            }
            .tag(4)
            
            // Reorder Tab
            NavigationView {
                Text("Reorder Content")
            }
            .tabItem {
                Image(systemName: "arrow.clockwise")
                Text("Reorder")
            }
            .tag(5)
        }
        .accentColor(Color(hex: "FF6016")) // Apply custom color to the selected tab
    }
}
