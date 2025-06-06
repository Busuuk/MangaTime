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
                        .foregroundColor(.purple)
                }
            
            // Profile Tab
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.fill")
                        .foregroundColor(.purple)
                        
                }
        }
    }
}
#Preview {
    
    ContentView()
        .environmentObject(MangaViewModel())
    
   
}
