//
//  DescripModuleInteractor.swift
//  RickAndMorty
//
//  Created by Aleksei Omelchenko on 10/13/22.
//

import Foundation

class DescripModuleInteractor: PresenterToInteractorCharacterCardProtocol {

    // MARK: - Properties
    var presenter: InteractorToPresenterCharacterCardProtocol?
    var description: CharacterModel?
    
    init(description: CharacterModel?) {
        self.description = description
    }
    
    // MARK: - Methods
    func getData() {
        debugLog(object: self)
        
        if let description = self.description {
            presenter?.success(description: description)
        } else {
            presenter?.failure()
        }
    }
}
