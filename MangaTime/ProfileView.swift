//
//  ProfileView.swift
//  MangaTime
//
//  Created by Simone Di Blasi on 12/12/24.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var viewModel: MangaViewModel // ViewModel globale
    
    let profileImage = "profile_image"
    let userName = "TENSHI わいふ"
    let location = "Ukraine, Kyiv"
    let bio = "Hello!♡"
    
    let favoriteCharacters = [
        ("Guts", "Berserk1"),
        ("Lawliet, L", "LawlietImage"),
        ("Nana Osaki", "NanaImage")
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 16) {
                    // Header del profilo
                    profileHeader
                    
                    // Sezione Manga Preferiti
                    SectionView(title: "FAVOURITE MANGA") {
                        MangaScrollView(mangaList: viewModel.mangaList.filter { $0.favorite })
                    }
                    
                    Spacer()
                }
                .padding()
            }
        }
    }
    
    // MARK: - Profile Header
    private var profileHeader: some View {
        VStack {
            ZStack {
                Image("backgroundImage")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
                
                Image(profileImage)
                    .resizable()
                    .clipShape(Circle())
                    .frame(width: 100, height: 100)
                    .offset(y: 50)
            }
            .padding(.bottom, 40)
            
            Text(userName)
                .font(.title2)
                .bold()
            Text(location)
                .foregroundColor(.gray)
            Text(bio)
                .italic()
                .foregroundColor(.secondary)
        }
    }
}

// MARK: - MangaScrollView con NavigationLink
struct MangaScrollView: View {
    var mangaList: [Manga]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 16) {
                ForEach(mangaList) { manga in
                    NavigationLink(destination: MangaDetailView(manga: manga)) {
                        VStack {
                            Image(manga.imageName)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 120, height: 170)
                                .clipped()
                                .cornerRadius(8)
                            
                            Text(manga.title)
                                .font(.subheadline)
                                .bold()
                                .foregroundColor(.primary)
                            
                            
                        }
                    }
                }
            }
        }
    }
}



// MARK: - Section View
struct SectionView<Content: View>: View {
    let title: String
    let content: Content
    
    init(title: String, @ViewBuilder content: () -> Content) {
        self.title = title
        self.content = content()
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .font(.headline)
                .bold()
            content
        }
    }
}

// MARK: - Preview


#Preview {
    // Crea una lista di manga di esempio
    let sampleMangaList = [
        Manga(
            title: "Berserk",
            imageName: "Berserk1",
            status: "Publishing",
            genre: ["Action", "Fantasy"],
            author: ["Kentaro Miura"],
            synopsis: "Guts, a former mercenary now known as the 'Black Swordsman,' is out for revenge...",
            chapters: ["Berserk1", "Berserk2", "Berserk3"],
            favorite: true
        ),
        Manga(
            title: "One Piece",
            imageName: "OnePiece1",
            status: "Ongoing",
            genre: ["Adventure", "Action"],
            author: ["Eiichiro Oda"],
            synopsis: "Monkey D. Luffy sails the seas to become the Pirate King.",
            chapters: ["OnePiece1", "OnePiece2"],
            favorite: false
        )
    ]
    
    // Inizializza il ViewModel con la lista di esempio
    var viewModel = MangaViewModel(mangaList: sampleMangaList)
    
    // Fornisci l'EnvironmentObject alla ProfileView
   ProfileView()
        .environmentObject(viewModel)
}

