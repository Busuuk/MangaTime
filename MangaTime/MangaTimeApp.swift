//
//  MangaTimeApp.swift
//  MangaTime
//
//  Created by Simone Di Blasi on 12/12/24.
//

import SwiftUI

@main
struct MangaTimeApp: App {
    @StateObject private var viewModel = MangaViewModel(mangaList: mangaList)
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
        }
    }
}
