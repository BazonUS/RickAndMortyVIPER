//
//  DescripModuleViewController.swift
//  RickAndMorty
//
//  Created by Aleksei Omelchenko on 10/13/22.
//

import UIKit
import Kingfisher

class CharacterCardViewController: UIViewController {
    
    // MARK: - Properties
    var presenter: ViewToPresenterCharacterCardProtocol?
    
    private let characterImage: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    private let characterNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 25)
        label.numberOfLines = 0
        return label
    }()
    
    private let characterGenderLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)
        label.numberOfLines = 0
        return label
    }()
    
    private let characterStatusView: UIView = {
        let view = UIView()
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 12
        return view
    }()
    
    private let characterStatusLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private let characterOriginLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var personalInfoStack: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [characterNameLabel, characterGenderLabel, characterOriginLabel])
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .fillProportionally
        return stackView
    }()
    
    private lazy var backButtonItem: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Back", for: .normal)
        button.addTarget(self, action: #selector(tapBackButton), for: .touchUpInside)
        return button
    }()

    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        configurationUI()
    }
    
    private func configurationUI() {
        view.backgroundColor = .white
        view.addSubview(characterImage)
        characterImage.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.width.height.equalTo(ScreenSize.width - 100)
        }

        view.addSubview(characterStatusView)
        characterStatusView.snp.makeConstraints { make in
            make.top.equalTo(characterImage.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
            make.height.equalTo(30)
            make.width.equalTo(ScreenSize.width - 100)
        }

        characterStatusView.addSubview(characterStatusLabel)
        characterStatusLabel.snp.makeConstraints { make in
            make.center.equalTo(characterStatusView)
        }

        view.addSubview(personalInfoStack)
        personalInfoStack.snp.makeConstraints { make in
            make.top.equalTo(characterStatusView.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
            make.height.equalTo(200)
        }
        
        view.addSubview(backButtonItem)
        backButtonItem.snp.makeConstraints { make in
            make.height.equalTo(50)
            make.top.equalTo(personalInfoStack.snp.bottom).offset(10)
            make.left.right.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    //MARK: - Objc methods
    @objc func tapBackButton() {
        debugLog(object: self)

        presenter?.tapBackButton()
    }
}
//MARK: - PresenterToViewCharacterCardProtocol
extension CharacterCardViewController: PresenterToViewCharacterCardProtocol{
    func setDescription(description: CharacterModel?) {
        debugLog(object: self)
        
        let url = URL(string: description!.image)
        let processor = RoundCornerImageProcessor(cornerRadius: 92)
        characterImage.kf.setImage(with: url, options: [.processor(processor)])
        characterImage.kf.setImage(with: url, placeholder: UIImage(systemName: "camera.metering.unknown") )
        characterNameLabel.text = description?.name
        characterGenderLabel.text = "\(description!.species), \(description!.gender.lowercased())"
        characterOriginLabel.text = "📍" + description!.origin.name
        switch description?.status {
        case "Alive" :
            characterStatusView.backgroundColor = AppColors.backgroundGreen
            characterStatusLabel.textColor = AppColors.textGreen
        case "Dead" :
            characterStatusView.backgroundColor = AppColors.backgroundRed
            characterStatusLabel.textColor = AppColors.textRed
        case "unknown" :
            characterStatusView.backgroundColor = AppColors.backgroundGray
            characterStatusLabel.textColor = AppColors.textGray
        default:
            characterStatusView.backgroundColor = AppColors.backgroundGray
            characterStatusLabel.textColor = AppColors.textGray

        }
        characterStatusLabel.text = description?.status.uppercased()
    }
    
    func showErrorAlert() {
        debugLog(object: self)
        
        let alertController = UIAlertController(title: "Error!", message: "There is a problem with your model", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Ok", style: .default))
        self.present(alertController, animated: true)
    }
}
