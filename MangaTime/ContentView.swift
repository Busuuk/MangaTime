//
//  ContentView.swift
//  MangaTime
//
//  Created by Simone Di Blasi on 12/12/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            // Home Tab
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }
            
            // Search Tab
            SearchView()
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                }
            
            // Profile Tab
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.fill")
                        
                }
        }
    }
}
#Preview {
    ContentView()
}
