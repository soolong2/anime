//
//  animeModal.swift
//  anime
//
//  Created by so on 2022/05/19.
//

import Foundation

struct AnimePosterImage: Codable {
    let tiny: String
    let large: String
    let small: String
    let medium: String
    let original: String
}

struct AnimeAttribytes: Codable {
    let synopsis: String
    let canonicalTitle: String
    let posterImage: AnimePosterImage
}

struct AnimeData: Codable {
    let id: String
    let type: String
    let attributes: AnimeAttribytes
}

struct AnimLinks: Codable {
    let next: String
}

struct AnimeModel: Codable {
    var data: [AnimeData]
    var links: AnimLinks
}


