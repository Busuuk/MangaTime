//
//  MangaViewModel.swift
//  MangaTime
//
//  Created by Simone Di Blasi on 17/12/24.
//


import SwiftUI

class MangaViewModel: ObservableObject {
    @Published var mangaList: [Manga]
    
    init(mangaList: [Manga] = []) {
        self.mangaList = mangaList
    }
    
    // Funzione per aggiungere/rimuovere dai preferiti
    func toggleFavorite(manga: Manga) {
        if let index = mangaList.firstIndex(where: { $0.id == manga.id }) {
            mangaList[index].favorite.toggle()
        }
    }
}
