//
//  SearchView.swift
//  MangaTime
//
//  Created by Simone Di Blasi on 12/12/24.
//

import SwiftUI
struct SearchView: View {
    @State private var searchText: String = ""
    @State private var selectedGenre: String? = nil

    // Lista di generi disponibili
    let genres = ["ADVENTURE", "FANTASY", "ACTION", "DRAMA", "HORROR", "SCI-FI", "ROMANCE", "HISTORICAL"]
        
    

    var filteredManga: [Manga] {
        mangaList.filter { manga in
            // Filtro per genere (se selezionato)
            let matchesGenre = selectedGenre == nil || manga.genre.contains(selectedGenre!)
            // Filtro per testo della ricerca
            let matchesSearch = searchText.isEmpty || manga.title.localizedCaseInsensitiveContains(searchText)
            return matchesGenre && matchesSearch
        }
    }

    var body: some View {
        
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading) {
                    // Barra di ricerca
                    HStack {
                        TextField("Search a manga...", text: $searchText)
                            .padding(10)
                            .background(Color(.systemGray6))
                            .cornerRadius(8)
                            .padding(.horizontal)
                            .accessibilityLabel("Search for a manga")
                            

                       
                        .padding(.trailing)
                    }
                    .padding(.top)

                   

                    // Pulsanti per i filtri dei generi
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(genres, id: \.self) { genre in
                                Button(action: {
                                    if selectedGenre == genre {
                                        selectedGenre = nil // Deseleziona se già selezionato
                                    } else {
                                        selectedGenre = genre // Seleziona il nuovo genere
                                    }
                                }) {
                                    Text(genre)
                                        .padding(.horizontal, 10)
                                        .padding(.vertical, 6)
                                        .background(selectedGenre == genre ? Color.purple : Color(.systemGray6))
                                        .foregroundColor(selectedGenre == genre ? Color.white: .purple)
                                        .cornerRadius(8)
                                        .accessibilityLabel("Filter by \(genre)")
                                }
                            }
                        }
                        .padding(.horizontal)
                    }

                    if searchText.isEmpty {
                    // Sezione Lista Manga
                    Text("RECOMMENDED")
                        .font(.headline)
                        .padding(.horizontal)
                        .padding(.top)
                        .accessibilityLabel("Recommended Manga List")
                    }

                    ScrollView(.horizontal, showsIndicators: false) {
                                            HStack(spacing: 16) {
                                                ForEach(mangaList.filter { manga in
                                                    // Filtro per genere
                                                    let matchesGenre = selectedGenre == nil || manga.genre.contains { $0.lowercased() == selectedGenre!.lowercased() }
                                                    // Filtro per testo della ricerca
                                                    let matchesSearch = searchText.isEmpty || manga.title.localizedCaseInsensitiveContains(searchText)
                                                    return matchesGenre && matchesSearch
                                                }) { manga in
                                                    NavigationLink(destination: MangaDetailView(manga: manga)) {
                                                        VStack {
                                                            Image( manga.imageName)
                                                                .resizable()
                                                                .frame(width: 120, height: 180)
                                                                .cornerRadius(8)
                                                            
                                                            Text(manga.title)
                                                                .font(.caption)
                                                                .foregroundColor(.primary)
                                                                .lineLimit(1)
                                                                .accessibilityLabel("Manga: \(manga.title)")
                                                        }
                                                        .frame(width: 120)
                                                        .padding(.vertical, 8)
                                                    }
                                                }
                                            }
                        
                        
                                            .padding(.horizontal)
                                        }

                   
                }
            }

            .navigationTitle("マンガ")
        }
    }
}

    
    
    
   
    
struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
