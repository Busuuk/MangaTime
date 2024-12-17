//
//  MangaDetailView.swift
//  MangaTime
//
//  Created by Simone Di Blasi on 13/12/24.
//

import SwiftUI

struct MangaDetailView: View {
    
    
    var manga: Manga  /*Manga(
        title: "Berserk",
        imageName: "Berserk1",
        status: "Publishing",
        genre: ["Action", "Fantasy"],
        author: ["Kentaro Miura"],
        synopsis: "Guts, a former mercenary now known as the 'Black Swordsman,' is out for revenge...",
        chapters: [
            "Berserk1", "Berserk2", "Berserk3", "Berserk4"
        ],
        favorite: false
    ) */
    
    
    @EnvironmentObject var viewModel: MangaViewModel // Accedi al ViewModel
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                // Titolo e immagine
                HStack(alignment: .top, spacing: 12) {
                    Image(manga.imageName)
                        .resizable()
                        .frame(width: 100, height: 150)
                        .cornerRadius(8)
                        .accessibilityLabel("Cover image of \(manga.title)") // Accessibility label for image
                    
                    VStack(alignment: .leading, spacing: 6) {
                        Text(manga.title)
                            .font(.title3)
                            .bold()
                            .accessibilityLabel(manga.title) // Accessibility label for title
                        Text(manga.status)
                            .accessibilityLabel("Status: \(manga.status)") // Accessibility label for status
                        Text(manga.genre.joined(separator: " | "))
                            .accessibilityLabel("Genres: \(manga.genre.joined(separator: ", "))") // Accessibility label for genres
                        Text("Author: \(manga.author.joined(separator: ", "))")
                            .font(.caption)
                            .accessibilityLabel("Author: \(manga.author.joined(separator: ", "))") // Accessibility label for authors
                    }
                }
                
                // Bottone Add to List
                Button(action: {
                    viewModel.toggleFavorite(manga: manga) // Modifica il valore preferito
                }) {
                    Text(manga.favorite ? "REMOVE FROM LIST" : "ADD TO LIST")
                        .font(.subheadline)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(manga.favorite ? Color.purple : Color.purple)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .accessibilityLabel(manga.favorite ? "Remove \(manga.title) from list" : "Add \(manga.title) to list") // Accessibility label for button
                
                // Sinossi
                Text("SYNOPSIS")
                    .font(.headline)
                Text(manga.synopsis)
                    .font(.body)
                    .lineLimit(4)
                    .accessibilityLabel("Synopsis: \(manga.synopsis)") // Accessibility label for synopsis
                
                // Capitoli (Volumi)
                Text("VOLUMES")
                    .font(.headline)
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 12) {
                        ForEach(manga.chapters, id: \.self) { chapter in
                            Image(chapter)
                                .resizable()
                                .frame(width: 120, height: 180)
                                .cornerRadius(8)
                                .accessibilityLabel("Chapter image of \(chapter)") // Accessibility label for chapters
                        }
                    }
                }
                
                Spacer()
                
            }
            .padding()
        }
    }
}
    

//#Preview {
  //  MangaDetailView()
//}
 #Preview {
    let sampleManga = Manga(
        title: "Berserk",
        imageName: "Berserk1",
        status: "Publishing",
        genre: ["Action", "Fantasy"],
        author: ["Kentaro Miura"],
        synopsis: "Guts, a former mercenary now known as the 'Black Swordsman,' is out for revenge...",
        chapters: [
            "Berserk1", "Berserk2", "Berserk3", "Berserk4"
        ],
        favorite: false
    )
     
    let viewModel = MangaViewModel(mangaList: [sampleManga])
    
    return MangaDetailView(manga: sampleManga)
        .environmentObject(viewModel) // Passa l'EnvironmentObject per la preview
}

