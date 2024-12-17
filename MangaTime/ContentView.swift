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
            
            
            // Search Tab
            SearchView()
                .tabItem {
                    Label("Home", systemImage: "house.fill")
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
        .environmentObject(MangaViewModel())
    
   
}
