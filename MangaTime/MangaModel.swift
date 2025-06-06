//
//  MangaModel.swift
//  MangaTime
//
//  Created by Simone Di Blasi on 12/12/24.
//

import Foundation



struct Manga: Identifiable {
    var id = UUID()
    var title: String
    var imageName: String
    var status: String
    var genre: [String]
    var author: [String]
    var synopsis: String
    var chapters: [String]
    var favorite: Bool
}
