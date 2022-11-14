//
//  CardsCollectionInteractor.swift
//  RickAndMorty
//
//  Created by Aleksei Omelchenko on 10/13/22.
//

import Foundation

class CardsCollectionInteractor: PresenterToInteractorCardsCollectionProtocol {
    
    // MARK: - Properties
    var presenter: InteractorToPresenterCardsCollectionProtocol?
    let networkService: NetworkServiceProtocol?
    var characters: [CharacterModel]? = []
    
    init(networkService: NetworkServiceProtocol?) {
        self.networkService = networkService
    }
    
    // MARK: - Properties
    func requestData() {
        debugLog(object: self)
        
        networkService?.requestData { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let characters):
                self.characters?.append(contentsOf: characters!.results)
                self.presenter?.didFetchSuccess()
            case .failure(let error):
                self.presenter?.didFetchFailure(error: error)
            }
        }
    }
}
