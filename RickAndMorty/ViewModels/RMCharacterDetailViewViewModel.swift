//
//  RMCharacterDetailViewViewModel.swift
//  RickAndMorty
//
//  Created by Sévio Basilio Corrêa on 13/01/23.
//

import Foundation



final class RMCharacterDetailViewViewModel {
    private let character: RMCharacter
    
    init(character: RMCharacter) {
        self.character = character
    }
    
    public var title: String {
        character.name.uppercased()
    }
}
