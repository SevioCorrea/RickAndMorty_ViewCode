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
        
        RMService.shared.execute(.listCharacterRequests, expeting: RMGetAllCharactersReponse.self) { result in
            switch result {
            case .success(let model):
                print("Total "+String(model.info.count))
                print("Page result count "+String(model.results.count))
            case .failure(let error):
                print(String(describing: error))
            }
        }
    }
}
