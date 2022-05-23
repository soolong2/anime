//
//  animeModal.swift
//  anime
//
//  Created by so on 2022/05/19.
//

import Foundation

struct AinmCoverImage:Codable{
    let large: String
}
struct AnimePosterImage: Codable {
    let tiny: String
    let large: String
    let small: String
    let medium: String
    let original: String
}

struct AnimeAttribytes: Codable {
    let synopsis: String
    let coverImage: AinmCoverImage?
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


