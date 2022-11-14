//
//  DescripModulePresenter.swift
//  RickAndMorty
//
//  Created by Vadim Voronkov on 17.10.2022.
//  
//

import Foundation

class DescripModulePresenter: ViewToPresenterDescripModuleProtocol {

    // MARK: Properties
    var view: PresenterToViewDescripModuleProtocol?
    var interactor: PresenterToInteractorDescripModuleProtocol?
    var router: PresenterToRouterDescripModuleProtocol?
    
    func viewDidLoad() {
        interactor?.getData()
    }
}

extension DescripModulePresenter: InteractorToPresenterDescripModuleProtocol {
    func success(description: CharacterModel?) {
        view?.setDescription(description: description)
    }
}
