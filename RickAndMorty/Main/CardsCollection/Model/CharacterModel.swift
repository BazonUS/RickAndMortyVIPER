//
//  CharacterModel.swift
//  RickAndMorty
//
//  Created by Aleksei Omelchenko on 10/13/22.
//

import Foundation

class AllChar: Codable {
    let info: Info
    var results: [CharacterModel]
}

class Info: Codable {
    let count: Int
    let pages: Int
    let next: String?
    let prev: String?
}

class CharacterModel: Codable {

    var id: Int
    var name: String
    var status: String
    var species: String
    var type: String
    var gender: String
    var origin: Origin
    var location: Location
    var image: String
    var episode: [String]
    var url: String
    var created: String
}

struct Origin: Codable {
    var name: String
    var url: String
}

struct Location: Codable {
    var name: String
    var url: String
}
