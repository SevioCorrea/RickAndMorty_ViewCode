//
//  RMCharacterViewController.swift
//  RickAndMorty
//
//  Created by Sévio Basilio Corrêa on 31/12/22.
//

import UIKit



/// Controller para mostrar e pesquisar os Personagens
final class RMCharacterViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground

        title = "Characters"
        
        let request = RMRequest(endpoint: .character, pathComponents: ["1"], queryParameters: [URLQueryItem(name: "name", value: "rick"), URLQueryItem(name: "status", value: "alive")])
        print(request.url)
        
        RMService.shared.execute(request, expeting: String.self) { result in
            <#code#>
        }
    }

}
