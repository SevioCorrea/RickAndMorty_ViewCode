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
    
    enum RMServiceError: Error {
        case failedToCreateRequest
        case failedToGetData
    }
    
    /// Chamando API
    /// - Parameters:
    ///   - request: Instância Request
    ///   - type: O tipo de objeto que esperamos receber de volta
    ///   - completion: Callback com dados ou error
    public func execute<T: Codable>(_ request: RMRequest,
                                    expeting type: T.Type,
                                    completion: @escaping (Result<T, Error>) -> Void) {
        guard let urlRequest = self.request(from: request) else {
            completion(.failure(RMServiceError.failedToCreateRequest))
            return
        }
        
        let task = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            guard let data = data, error == nil else {
                completion(.failure(error ?? RMServiceError.failedToGetData))
                return
            }
            
            // Decode Response
            do {
                let result = try JSONDecoder().decode(type.self, from: data)
                completion(.success(result))
            }
            catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
    
    private func request(from rmRequest: RMRequest) -> URLRequest? {
        guard let url = rmRequest.url else { return nil }
        
        var request = URLRequest(url: url)
        request.httpMethod = rmRequest.httpMethod
        
        
        return request
    }
}
