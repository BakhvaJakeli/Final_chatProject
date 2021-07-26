//
//  LogInViewModel.swift
//  Final_chatProject
//
//  Created by Baxva Jakeli on 24.07.21.
//

import UIKit
import FirebaseAuth
import JGProgressHUD

protocol LogInViewModelProtocoll: AnyObject {
    init(with viewcontroller: UIViewController, coordinator: CoordinatorProtocol)
    
    func setUpButton(with button: UIButton)
    func pressLogIn(with textOne: UITextField, textTwo: UITextField, controller: UIViewController)
    func wrongAllert(controller: UIViewController)
}

final class LogInViewModel: LogInViewModelProtocoll {
    
    private let spinner = JGProgressHUD(style: .dark)
    
    private weak var controller: UIViewController?
    
    var coordinator: CoordinatorProtocol?
    
    init(with viewcontroller: UIViewController, coordinator: CoordinatorProtocol) {
        self.controller = viewcontroller
        self.coordinator = coordinator
    }
    
    func setUpButton(with button: UIButton) {
        button.layer.cornerRadius = button.frame.height / 3
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.black.cgColor
    }

    func pressLogIn(with textOne: UITextField, textTwo: UITextField, controller: UIViewController) {
        guard let email = textOne.text,
              let password = textTwo.text,
              !email.isEmpty,
              !password.isEmpty else {
            wrongAllert(controller: controller)
            return
        }
        
        spinner.show(in: controller.view)
        
        FirebaseAuth.Auth.auth().signIn(withEmail: email, password: password) { [weak self] result, error in
            
            DispatchQueue.main.async {
                self?.spinner.dismiss()
            }
            
            guard let authresult = result, error == nil else {
                print("No such User")
                return
            }
            
            let user = authresult.user
            print("Logged in user \(user)")
            self?.coordinator?.proceedToTabBar()
        }
    }
    
    func wrongAllert(controller: UIViewController) {
        let alert = UIAlertController(title: "Wrong Credientails",
                                      message: "please enter all the information",
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok",
                                      style: .cancel,
                                      handler: nil))
        controller.present(alert,
                           animated: true,
                           completion: nil)
    }
}

