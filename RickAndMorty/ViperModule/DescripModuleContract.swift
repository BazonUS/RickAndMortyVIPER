//
//  DescripModuleContract.swift
//  RickAndMorty
//
//  Created by Vadim Voronkov on 17.10.2022.
//  
//

import Foundation


// MARK: View Output (Presenter -> View)
protocol PresenterToViewDescripModuleProtocol {
    func setDescription(description: CharacterModel?)
}


// MARK: View Input (View -> Presenter)
protocol ViewToPresenterDescripModuleProtocol {
    
    var view: PresenterToViewDescripModuleProtocol? { get set }
    var interactor: PresenterToInteractorDescripModuleProtocol? { get set }
    var router: PresenterToRouterDescripModuleProtocol? { get set }
    
    func viewDidLoad()
}


// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorDescripModuleProtocol {
    
    var presenter: InteractorToPresenterDescripModuleProtocol? { get set }
    var description: CharacterModel? { get set }
    func getData()
}


// MARK: Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterDescripModuleProtocol {
    
    func success(description: CharacterModel?)
}


// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterDescripModuleProtocol {
    
}
