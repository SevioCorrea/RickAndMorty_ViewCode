//
//  RMLocation.swift
//  RickAndMorty
//
//  Created by Sévio Basilio Corrêa on 31/12/22.
//

import Foundation

struct RMLocation: Codable {
    
    let id: Int
    let name: String
    let type: String
    let dimension: String
    let residents: [String]
    let url: String
    let created: String
}