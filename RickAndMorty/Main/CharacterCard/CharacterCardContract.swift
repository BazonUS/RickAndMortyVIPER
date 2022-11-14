//
//  DescripModuleContract.swift
//  RickAndMorty
//
//  Created by Aleksei Omelchenko on 10/13/22.
//

import Foundation

// MARK: - View Output (Presenter -> View)
protocol PresenterToViewCharacterCardProtocol {
    func setDescription(description: CharacterModel?)
    func showErrorAlert()
}

// MARK: - View Input (View -> Presenter)
protocol ViewToPresenterCharacterCardProtocol {
    
    var view: PresenterToViewCharacterCardProtocol? { get set }
    var interactor: PresenterToInteractorCharacterCardProtocol? { get set }
    var router: PresenterToRouterCharacterCardProtocol? { get set }
    
    func viewDidLoad()
    func tapBackButton()
}

// MARK: - Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorCharacterCardProtocol {
    
    var presenter: InteractorToPresenterCharacterCardProtocol? { get set }
    var description: CharacterModel? { get set }
    func getData()
}

// MARK: - Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterCharacterCardProtocol {
    
    func success(description: CharacterModel?)
    func failure()
}

// MARK: - Router Input (Presenter -> Router)
protocol PresenterToRouterCharacterCardProtocol {
    func navigateToPreviouslyScreen()
}
