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
    let genres = ["Shonen", "Seinen", "Fantasy", "Action", "Drama", "Horror", "Sci-Fi"]
        
    

    var filteredManga: [Manga] {
        mangaList.filter { manga in
            // Filtro per genere (se selezionato)
            let matchesGenre = selectedGenre == nil || manga.title.contains(selectedGenre!)
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
                        TextField("Cerca un manga...", text: $searchText)
                            .padding(10)
                            .background(Color(.systemGray6))
                            .cornerRadius(8)
                            .padding(.horizontal)

                        Button(action: {
                            print("Cercando: \(searchText)")
                        }) {
                            Image(systemName: "magnifyingglass")
                                .padding(10)
                                .foregroundColor(.white)
                                .background(Color.blue)
                                .cornerRadius(8)
                        }
                        .padding(.trailing)
                    }
                    .padding(.top)

                    // Sezione Generi
                    Text("Genere")
                        .font(.headline)
                        .padding(.horizontal)
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
                                        .background(selectedGenre == genre ? Color.blue : Color(.systemGray6))
                                        .foregroundColor(selectedGenre == genre ? .white : .black)
                                        .cornerRadius(8)
                                }
                            }
                        }
                        .padding(.horizontal)
                    }

                    // Sezione Lista Manga
                    Text("Raccomandati")
                        .font(.headline)
                        .padding(.horizontal)
                        .padding(.top)

                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 16) {
                            
                                ForEach(filteredManga) { manga in
                                    if selectedGenre == nil || manga.genres.contains(selectedGenre ?? "") {
                                    NavigationLink(destination: MangaDetailView(manga: manga)) {
                                        VStack {
                                            Image(systemName: manga.imageName)
                                                .resizable()
                                                .frame(width: 100, height: 100)
                                                .aspectRatio(contentMode: .fit)
                                                .background(Color(.systemGray5))
                                                .cornerRadius(12)
                                            
                                            Text(manga.title)
                                                .font(.caption)
                                                .foregroundColor(.primary)
                                                .lineLimit(1)
                                        }
                                        .frame(width: 120)
                                        .padding(.vertical, 8)
                                    }
                                }
                            }
                        }
                        .padding(.horizontal)
                    }

                    Spacer()
                }
            }
            .navigationTitle("Ricerca Manga")
        }
    }
}
    
    
    
   
    
struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
