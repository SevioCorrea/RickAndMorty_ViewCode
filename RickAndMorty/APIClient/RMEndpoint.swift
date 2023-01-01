//
//  RMEndpoint.swift
//  RickAndMorty
//
//  Created by Sévio Basilio Corrêa on 01/01/23.
//

import Foundation



/// Representa o Endpoint da API
@frozen enum RMEndpoint: String {
    
    /// Endpoint para receber as informações dos Personagens
    case character
    /// Endpoint para receber as informações da Localização
    case location
    /// Endpoint para receber as informações dos Episódios
    case episode
}
