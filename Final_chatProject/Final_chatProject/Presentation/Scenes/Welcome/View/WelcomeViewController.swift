//
//  WelcomeViewController.swift
//  Final_chatProject
//
//  Created by Baxva Jakeli on 24.07.21.
//

import UIKit

class WelcomeViewController: BaseViewController {
    
    private var viewModel: WelcomeViewModelProtocol!

    @IBOutlet weak var proceedBtn: UIButton!
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var greetinsLabel: UILabel!
    @IBOutlet weak var messageImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        configureViewModel()
        welcomeLabel.alpha = 0
        greetinsLabel.alpha = 0
        proceedBtn.alpha = 0
        viewModel.setUpButton(with: proceedBtn)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [weak self] in
            self?.viewModel.animate(with: (self?.messageImage)!, with: (self?.welcomeLabel)!, with: (self?.greetinsLabel)!, button: (self?.proceedBtn)!, controller: self!)
        }
    }

    @IBAction func onProceed(_ sender: Any) {
        coordinator?.proceedTologIn()
    }
    
}

extension WelcomeViewController {

    
    func configureViewModel() {
        viewModel = WelcomeViewModel(with: self)
    }
}
