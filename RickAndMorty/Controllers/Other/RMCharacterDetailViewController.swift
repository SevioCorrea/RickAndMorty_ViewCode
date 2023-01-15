//
//  RMCharacterDetailViewController.swift
//  RickAndMorty
//
//  Created by Sévio Basilio Corrêa on 13/01/23.
//

import UIKit



/// Controller para mostrar os detalhes de um Personagem
class RMCharacterDetailViewController: UIViewController {
    private let viewModel: RMCharacterDetailViewViewModel

    init(viewModel: RMCharacterDetailViewViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        title = viewModel.title
    }

}
