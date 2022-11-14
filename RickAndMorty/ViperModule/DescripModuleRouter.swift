//
//  DescripModuleRouter.swift
//  RickAndMorty
//
//  Created by Vadim Voronkov on 17.10.2022.
//  
//

import Foundation
import UIKit

class DescripModuleRouter: PresenterToRouterDescripModuleProtocol {
    
    // MARK: Static methods
    static func createModule(description: CharacterModel?) -> UIViewController {
        
        let viewController = DescripModuleViewController()
        
        let presenter: ViewToPresenterDescripModuleProtocol & InteractorToPresenterDescripModuleProtocol = DescripModulePresenter()
        
        viewController.presenter = presenter
        viewController.presenter?.router = DescripModuleRouter()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = DescripModuleInteractor(description: description)
        viewController.presenter?.interactor?.presenter = presenter
        
        return viewController
    }
    
}
