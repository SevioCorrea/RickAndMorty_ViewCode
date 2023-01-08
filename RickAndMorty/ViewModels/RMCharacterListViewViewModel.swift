//
//  CharacterListViewViewModel.swift
//  RickAndMorty
//
//  Created by Sévio Basilio Corrêa on 06/01/23.
//

import UIKit



final class RMCharacterListViewViewModel: NSObject {
    func fetchCharacters () {
        RMService.shared.execute(.listCharacterRequests, expeting: RMGetAllCharactersReponse.self) { result in
            switch result {
            case .success(let model):
                print("Example Image URL "+String(model.results.first?.image ?? "No Image"))
            case .failure(let error):
                print(String(describing: error))
            }
        }
    }
}

extension RMCharacterListViewViewModel: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RMCharacterCollectionViewCell.cellIdentifier, for: indexPath) as? RMCharacterCollectionViewCell else {
            fatalError("Unsuported Cell")
        }
        let viewModel = RMCharacterCollectionViewCellViewModel(characterName: "Character", characterStatus: .alive, characterImageURL: URL(string: "https://rickandmortyapi.com/api/character/avatar/1.jpeg"))
        cell.configure(with: viewModel)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt IndexPath: IndexPath) -> CGSize {
        let bounds = UIScreen.main.bounds
        let width = (bounds.width-30)/2
        return CGSize(width: width, height: width  * 1.5)
    }
}
