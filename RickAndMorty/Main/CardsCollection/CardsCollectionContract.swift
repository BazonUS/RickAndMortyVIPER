//
//  CardsCollectionContract.swift
//  RickAndMorty
//
//  Created by Aleksei Omelchenko on 10/13/22.
//

import Foundation
import UIKit

// MARK: - View Output (Presenter -> View)
protocol PresenterToViewCardsCollectionProtocol {
    func succes()
    func failure(error: Error)
}

// MARK: - View Input (View -> Presenter)
protocol ViewToPresenterCardsCollectionProtocol {
    
    var view: PresenterToViewCardsCollectionProtocol? { get set }
    var interactor: PresenterToInteractorCardsCollectionProtocol? { get set }
    var router: PresenterToRouterCardsCollectionProtocol? { get set }
    var characters: [CharacterModel]? { get }
    
    func viewDidLoad()
    func tapOnTheCharacter(character: CharacterModel?)
}

// MARK: - Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorCardsCollectionProtocol {
    var characters: [CharacterModel]? { get set }
    var presenter: InteractorToPresenterCardsCollectionProtocol? { get set }
    func requestData()
}

// MARK: - Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterCardsCollectionProtocol {
    func didFetchSuccess()
    func didFetchFailure(error: Error)
}

// MARK: - Router Input (Presenter -> Router)
protocol PresenterToRouterCardsCollectionProtocol {
    func showDescription(description: CharacterModel?)
}
