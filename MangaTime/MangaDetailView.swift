//
//  MangaDetailView.swift
//  MangaTime
//
//  Created by Simone Di Blasi on 13/12/24.
//

import SwiftUI

// Dettagli del Manga
struct MangaDetailView: View {
    let manga: Manga

    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: manga.imageName)
                .resizable()
                .frame(width: 150, height: 150)
                .aspectRatio(contentMode: .fit)
                .background(Color(.systemGray5))
                .cornerRadius(12)

            Text(manga.title)
                .font(.title)
                .fontWeight(.bold)

            Spacer()
        }
        .padding()
        .navigationTitle(manga.title)
    }
}

#Preview {
    MangaDetailView(manga: Manga(title: "Manga Title", imageName: "manga", status: "", genres: [""], author: [""], synopsis: "", chapters: [""]))
}
