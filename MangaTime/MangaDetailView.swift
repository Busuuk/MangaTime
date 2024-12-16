//
//  MangaDetailView.swift
//  MangaTime
//
//  Created by Simone Di Blasi on 13/12/24.
//

import SwiftUI
struct MangaDetailView: View {
    let manga: Manga
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            // Title e Manga Image Row
            HStack(alignment: .top, spacing: 12) {
                Image(manga.imageName) // Immagine principale
                    .resizable()
                    .frame(width: 100, height: 150)
                    .cornerRadius(8)
                
                VStack(alignment: .leading, spacing: 6) {
                    Text(manga.title)
                        .font(.title3)
                        .bold()
                    Text(manga.status)
                    Text(manga.genre.joined(separator: " | "))
                    Text("Author: \(manga.author.joined(separator: ", "))")
                        .font(.caption)
                }
            }
            
            // Synopsis
            Text("SYNOPSIS")
                .font(.headline)
            Text(manga.synopsis)
                .font(.body)
                .lineLimit(4)
            
            // Capitoli
            Text("CHAPTERS")
                .font(.headline)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 12) {
                    ForEach(0..<manga.chapters.count, id: \.self) { index in
                        Image(manga.chapters[index]) // Converti la stringa in un'immagine
                            .resizable()            // Ora puoi usare resizable
                            .frame(width: 120, height: 180)
                            .cornerRadius(8)
                    }
                }
            }
            
            
            Spacer()
        }
        .padding()
    }
}

#Preview {
    MangaDetailView(
        manga: Manga(
            title: "Berserk",
            imageName: "Berserk1",
            status: "Publishing",
            genre: ["Action", "Fantasy"],
            author: ["Kentaro Miura"],
            synopsis: "Guts, a former mercenary now known as the 'Black Swordsman,' is out for revenge...",
            chapters: [
                ("Berserk1"),
                ("Berserk2"),
                ("Berserk3"),
                ("Berserk4")
            
            ]
        )
    )
}
