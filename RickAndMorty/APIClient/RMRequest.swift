//
//  RMRequest.swift
//  RickAndMorty
//
//  Created by Sévio Basilio Corrêa on 01/01/23.
//

import Foundation



/// Objeto que representa uma Chamada da API
final class RMRequest {
    // URL Base
    // Endpoint
    // Path Components
    // Query Parameters
    
    /// API Constants
    private struct Constants {
        static let baseUrl = "https://rickandmortyapi.com/api"
    }
    
    /// Endpoint
    private let endpoint: RMEndpoint
    
    /// Path Components for API, if Any
    private let pathComponents: Set<String>
    
    /// Query arguments for API, if Any
    private let queryParameters: [URLQueryItem]
    
    /// Constructed url for the api request in string format
    public var urlString: String {
        var string = Constants.baseUrl
        string += "/"
        string += endpoint.rawValue
        
        if !pathComponents.isEmpty {
            string += "/"
            pathComponents.forEach({
                string += "\($0)"
            })
        }
        
        if !queryParameters.isEmpty {
            string += "?"
            // name=value&name=value
            let argumentString = queryParameters.compactMap({
                guard let value = $0.value else {return nil}
                return "\($0.name)=\(value)"
            }).joined(separator: "&")
            
            string += argumentString
        }
        
        return string
    }
    
    /// Computed & constructed API url
    public var url: URL? {
        return URL(string: urlString)
    }
    
    /// Desired http method
    public let httpMethod = "GET"
    
    
    
    // MARK: - Public
    
    /// Construct Request
    /// - Parameters:
    ///   - endpoint: Target endpoint
    ///   - pathComponents: Collection of Path components
    ///   - queryParameters: Collection of query parameters
    public init(endpoint: RMEndpoint, pathComponents: Set<String> = [], queryParameters: [URLQueryItem] = []) {
        self.endpoint = endpoint
        self.pathComponents = pathComponents
        self.queryParameters = queryParameters
    }
}
