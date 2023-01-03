//
//  RMService.swift
//  RickAndMorty
//
//  Created by Sévio Basilio Corrêa on 01/01/23.
//

import Foundation




/// Objeto Serviço de API Primário para conseguir Dados Rick And Morty
final class RMService {
    
    /// Instância Singleton Compartilhada
    static let shared = RMService()
    
    /// Construtor Privado
    private init() {}
    
    /// Chamando API
    /// - Parameters:
    ///   - request: Instância Request
    ///   - type: O tipo de objeto que esperamos receber de volta
    ///   - completion: Callback com dados ou error
    public func execute<T: Codable>(_ request: RMRequest,
                                    expeting type: T.Type,
                                    completion: @escaping (Result<T, Error>) -> Void) {
        
    }
}
