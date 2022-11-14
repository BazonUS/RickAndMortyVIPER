//
//  CardsCollectionRouter.swift
//  RickAndMorty
//
//  Created by Aleksei Omelchenko on 10/13/22.
//

import UIKit

class CardsCollectionRouter {
    
    private weak var viewController: UIViewController?
    
    init(viewController: UIViewController) {
        self.viewController = viewController
    }
    
    // MARK: - Static methods
    static func createModule() -> UIViewController {

        let viewController = CardsCollectionViewController()
        let presenter: ViewToPresenterCardsCollectionProtocol & InteractorToPresenterCardsCollectionProtocol = CardsCollectionPresenter()
        let networkService = NetworkService()

        viewController.presenter = presenter
        viewController.presenter?.router = CardsCollectionRouter(viewController: viewController)
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = CardsCollectionInteractor(networkService: networkService)
        viewController.presenter?.interactor?.presenter = presenter

        return viewController
    }
}

//MARK: - PresenterToRouterCardsCollectionProtocol
extension CardsCollectionRouter: PresenterToRouterCardsCollectionProtocol {
    func showDescription(description: CharacterModel?) {
        let descriptionVC = CharacterCardRouter.createModule(description: description)
        self.viewController?.navigationController?.pushViewController(descriptionVC, animated: true)
    }
}
