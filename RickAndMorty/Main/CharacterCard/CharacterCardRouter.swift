//
//  DescripModuleRouter.swift
//  RickAndMorty
//
//  Created by Aleksei Omelchenko on 10/13/22.
//

import Foundation
import UIKit

class CharacterCardRouter {
    
    private weak var viewController: UIViewController?
    
    init(viewController: UIViewController) {
        self.viewController = viewController
    }
    
    // MARK: Static methods
    static func createModule(description: CharacterModel?) -> UIViewController {
        
        let viewController = CharacterCardViewController()
        let presenter: ViewToPresenterCharacterCardProtocol & InteractorToPresenterCharacterCardProtocol = CharacterCardPresenter()
        
        viewController.presenter = presenter
        viewController.presenter?.router = CharacterCardRouter(viewController: viewController)
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = DescripModuleInteractor(description: description)
        viewController.presenter?.interactor?.presenter = presenter
        
        return viewController
    }
    
}

//MARK: - PresenterToRouterDescripModuleProtocol
extension CharacterCardRouter: PresenterToRouterCharacterCardProtocol {
    func navigateToPreviouslyScreen() {
        debugLog(object: self)
        
        viewController?.navigationController?.popViewController(animated: true)
    }
}
