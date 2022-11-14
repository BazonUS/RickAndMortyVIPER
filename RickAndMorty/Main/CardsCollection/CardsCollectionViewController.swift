//
//  CardsCollectionViewController.swift
//  RickAndMorty
//
//  Created by Aleksei Omelchenko on 10/13/22.
//

import UIKit

class CardsCollectionViewController: UIViewController {
    
    //MARK: - Properties
    var presenter: ViewToPresenterCardsCollectionProtocol?
    
    private(set) lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(CharacterCell.self, forCellReuseIdentifier: CharacterCell.identifire)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        return tableView
    }()
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        configurationUI()
    }
    
    //MARK: - Methods
    private func configurationUI() {
        view.backgroundColor = .white
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.top.left.right.equalTo(view.safeAreaLayoutGuide)
            make.bottom.equalToSuperview()
        }
    }
}

//MARK: - PresenterToViewCardsCollectionProtocol
extension CardsCollectionViewController: PresenterToViewCardsCollectionProtocol{
    func succes() {
        debugLog(object: self)
        
        self.tableView.reloadData()
    }
    
    func failure(error: Error) {
        debugLog(object: self)
        
        let alertController = UIAlertController(title: "Error!", message: "Check your internet connection", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Ok", style: .default))
        self.present(alertController, animated: true)
    }
}

//MARK: - UITableViewDataSource
extension CardsCollectionViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.characters?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CharacterCell.identifire, for: indexPath) as? CharacterCell else {
            return UITableViewCell()
        }
        if let characters = presenter?.characters {
            cell.configureCell(model: characters[indexPath.row])
        }
        cell.selectionStyle = .none
        return cell
    }
}

//MARK: - UITableViewDelegate
extension CardsCollectionViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let description = presenter?.characters?[indexPath.row]
        presenter?.tapOnTheCharacter(character: description)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if let count = presenter?.characters?.count, count > 1 {
            let lastElement = count - 1
            if indexPath.row == lastElement {
                presenter?.viewDidLoad()
            }
        }
    }
}
