//
//  MangaModel.swift
//  MangaTime
//
//  Created by Simone Di Blasi on 12/12/24.
//

import Foundation



struct Manga: Identifiable {
    let id = UUID()
    let title: String
    let imageName: String
    let status: String
    let genre: [String]
    let author: [String]
    let synopsis: String
    let chapters: [String]
}
