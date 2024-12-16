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
    let genres = ["Adventure", "Fantasy", "Action", "Drama", "Horror", "Sci-Fi", "Romance", "Historical"]
        
    

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
                                        .background(selectedGenre == genre ? Color.blue : Color(.systemGray6))
                                        .foregroundColor(selectedGenre == genre ? .white : .black)
                                        .cornerRadius(8)
                                }
                            }
                        }
                        .padding(.horizontal)
                    }

                    if searchText.isEmpty {
                    // Sezione Lista Manga
                    Text("RACCOMENDED")
                        .font(.headline)
                        .padding(.horizontal)
                        .padding(.top)
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
                        
                        
                                            .padding(.horizontal)
                                        }

                    Spacer()
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
