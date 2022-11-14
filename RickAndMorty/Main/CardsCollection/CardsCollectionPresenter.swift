//
//  CardsCollectionPresenter.swift
//  RickAndMorty
//
//  Created by Aleksei Omelchenko on 10/13/22.
//

import Foundation


class CardsCollectionPresenter: ViewToPresenterCardsCollectionProtocol {
    
    // MARK: - Properties
    var view: PresenterToViewCardsCollectionProtocol?
    var interactor: PresenterToInteractorCardsCollectionProtocol?
    var router: PresenterToRouterCardsCollectionProtocol?
    
    var characters: [CharacterModel]? {
        get {
            interactor?.characters
        }
    }
    
    func viewDidLoad() {
        debugLog(object: self)
        
        interactor?.requestData()
    }
    
    func tapOnTheCharacter(character: CharacterModel?) {
        debugLog(object: self)
        
        router?.showDescription(description: character)
    }
}

//MARK: - InteractorToPresenterCardsCollectionProtocol
extension CardsCollectionPresenter: InteractorToPresenterCardsCollectionProtocol {
    func didFetchSuccess() {
        debugLog(object: self)
        
        view?.succes()
    }
    
    func didFetchFailure(error: Error) {
        debugLog(object: self)
        
        view?.failure(error: error)
    }
}
