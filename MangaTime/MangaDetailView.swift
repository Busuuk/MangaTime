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
        VStack(alignment: .leading, spacing: 16) {
            // Titolo e immagine
            HStack(alignment: .top, spacing: 12) {
                Image(manga.imageName)
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
            
            // Bottone Add to List
            Button(action: {
                viewModel.toggleFavorite(manga: manga) // Modifica il valore preferito
            }) {
                Text(manga.favorite ? "REMOVE FROM LIST" : "ADD TO LIST")
                    .font(.subheadline)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(manga.favorite ? Color.red.opacity(0.7) : Color.gray.opacity(0.2))
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            
            // Sinossi
            Text("SYNOPSIS")
                .font(.headline)
            Text(manga.synopsis)
                .font(.body)
                .lineLimit(4)
            
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
                    }
                }
            }
            
            Spacer()
        }
        .padding()
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

