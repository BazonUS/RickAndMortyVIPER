//
//  DescripModuleInteractor.swift
//  RickAndMorty
//
//  Created by Vadim Voronkov on 17.10.2022.
//  
//

import Foundation

class DescripModuleInteractor: PresenterToInteractorDescripModuleProtocol {

    // MARK: Properties
    var presenter: InteractorToPresenterDescripModuleProtocol?
    var description: CharacterModel?
    
    init(description: CharacterModel?) {
        self.description = description
    }
    
    func getData() {
        presenter?.success(description: self.description)
    }
}



//Presenter - все что не касается UI
//Выполняют всю логику с моделями и запросы из сети


//VIPER
//V - Все что связано с UI
//I - Все что связано с Запросами в сеть и моделью
//P - Все что отвечает за переходы между интерактором и вью + роутер
//R - Переходы между экранам
//E - Модель
