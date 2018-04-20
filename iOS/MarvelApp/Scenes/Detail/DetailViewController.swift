//
//  DetailViewController.swift
//  MarvelApp
//
//  Created by Suyash Srijan on 18/04/2018.
//  Copyright © 2018 Suyash Srijan. All rights reserved.
//

import Foundation
import UIKit
import SafariServices

protocol DetailDisplayLogic: class {
    func displayCharacterDetail(viewModel: DetailModel.ViewModel)
}

class DetailViewController: UIViewController, DetailDisplayLogic {
    
    var interactor: DetailBusinessLogic?
    var router: DetailRouter?
    var imageCacheManager: ImageCacheManager = ImageCacheManager.shared
    
    @IBOutlet var characterImageView: UIImageView!
    @IBOutlet var characterDescription: UILabel!
    @IBOutlet var characterDetailButton: UIButton!
    @IBOutlet var scrollView: UIScrollView!
    
    private var detailUrl: URL!
    public var viewModel: DetailModel.ViewModel!
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    private func setup() {
        self.navigationItem.backBarButtonItem?.title = "Characters"
        let viewController = self
        let interactor = DetailInteractor()
        let presenter = DetailPresenter()
        let router = DetailRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    
    private func setupLook() {
        let backgroundImageView = UIImageView()
        backgroundImageView.image = UIImage(named: "MarvelTileBackground")!
        self.scrollView.addSubview(backgroundImageView)
        self.characterDetailButton.titleLabel?.font = FontUtils.getMarvelFont(withSize: 16)
        self.characterDescription.font = FontUtils.getMarvelFont(withSize: 18)
        self.characterDetailButton.layer.cornerRadius = 10
        self.characterDetailButton.layer.masksToBounds = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupLook()
        getCharacterDetails()
    }
    
    
    func getCharacterDetails() {
        if viewModel == nil {
            let request = DetailModel.Request()
            interactor?.getCharacter(request: request)
        } else {
            displayCharacterDetail(viewModel: self.viewModel)
        }
    }
    
    func displayCharacterDetail(viewModel: DetailModel.ViewModel) {
        self.viewModel = viewModel
        imageCacheManager.getImage(imageUrl: self.viewModel.characterImageUrl!, completionHandler: { (image) in
            self.characterImageView.image = image
        })
        self.characterDescription.text = self.viewModel.characterDescription == "" ? "There is no description for this character" : String(encodedString: self.viewModel.characterDescription!)
        self.navigationItem.title = self.viewModel.characterName
        
        if self.viewModel.characterDetailUrl == nil {
            characterDetailButton.isHidden = true
        } else {
            detailUrl = self.viewModel.characterDetailUrl
        }
    }
    
    @IBAction func showCharacterDetail(_ sender: Any) {
        router?.navigateToSafariViewController(url: detailUrl)
    }
}
