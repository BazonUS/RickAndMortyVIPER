//
//  DescripModulePresenter.swift
//  RickAndMorty
//
//  Created by Aleksei Omelchenko on 10/13/22.
//

import Foundation

class CharacterCardPresenter: ViewToPresenterCharacterCardProtocol {

    // MARK: - Properties
    var view: PresenterToViewCharacterCardProtocol?
    var interactor: PresenterToInteractorCharacterCardProtocol?
    var router: PresenterToRouterCharacterCardProtocol?
    
    func viewDidLoad() {
        debugLog(object: self)
        
        interactor?.getData()
    }
    
    func tapBackButton() {
        debugLog(object: self)
        
        router?.navigateToPreviouslyScreen()
    }
}

//MARK: - InteractorToPresenterCardsCollectionProtocol
extension CharacterCardPresenter: InteractorToPresenterCharacterCardProtocol {
    func success(description: CharacterModel?) {
        debugLog(object: self)
        
        view?.setDescription(description: description)
    }
    
    func failure() {
        debugLog(object: self)

        view?.showErrorAlert()
    }
}
