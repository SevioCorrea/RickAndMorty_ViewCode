//
//  RMGetAllCharactersResponse.swift
//  RickAndMorty
//
//  Created by Sévio Basilio Corrêa on 05/01/23.
//

import Foundation



struct RMGetAllCharactersReponse: Codable {
    struct Info: Codable {
        let count: Int
        let pages: Int
        let next: String?
        let prev: String?
    }
    
    let info: Info
    let results: [RMCharacter]
}
