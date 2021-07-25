//
//  SignUpViewModel.swift
//  Final_chatProject
//
//  Created by Baxva Jakeli on 25.07.21.
//

import UIKit
import FirebaseAuth

protocol SignUpViewModelProtocol: AnyObject {
    init(with viewcontroller: UIViewController, coordinator: CoordinatorProtocol)
    
    func setUpImg(with image: UIImageView)
    func setUpButton(with button: UIButton)
    //    func setUpProfile(with image: UIImageView)
    func pressRegister(with name: UITextField, surname: UITextField, email: UITextField, password: UITextField, controller: UIViewController)
    func wrongAllert(controller: UIViewController, message: String)
    
}

final class SignUpViewModel: SignUpViewModelProtocol {
    private weak var controller: UIViewController?
    var coordinator : CoordinatorProtocol?
    
    init(with viewcontroller: UIViewController, coordinator: CoordinatorProtocol) {
        self.controller = viewcontroller
        self.coordinator = coordinator
    }
    
    func setUpImg(with image: UIImageView) {
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(proceed))
        image.isUserInteractionEnabled = true
        image.addGestureRecognizer(tapGestureRecognizer)
    }
    
    
    
    func setUpButton(with button: UIButton) {
        button.layer.cornerRadius = button.frame.height / 3
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.black.cgColor
    }
    
    //    func setUpProfile(with image: UIImageView) {
    //        let gesture = UITapGestureRecognizer(target: self, action: #selector(onProfile))
    //        image.isUserInteractionEnabled = true
    //        image.addGestureRecognizer(gesture)
    //    }
    
    func pressRegister(with name: UITextField, surname: UITextField, email: UITextField, password: UITextField, controller: UIViewController) {
        guard let name = name.text,
              let surname = surname.text,
              let mail = email.text,
              let pas = password.text,
              !name.isEmpty,
              !surname.isEmpty,
              !mail.isEmpty,
              !pas.isEmpty else {
            
            wrongAllert(controller: controller)
            return
            
        }
        
        DataBaseManager.shared.userExists(with: mail) { [weak self] exists in
            guard !exists else {
                self?.wrongAllert(controller: controller, message: "User with this Mail already exists")
                return //show error
            }
            
            FirebaseAuth.Auth.auth().createUser(withEmail: mail,
                                                password: pas) { [weak self] result, error in
                
                guard result != nil, error == nil else {
                    print("Eroor occured")
                    return
                }
                
                DataBaseManager.shared.insertUser(with: ChatAppUser(name: name,
                                                                    surName: surname,
                                                                    email: mail))
                self?.coordinator?.popBack()
            }
        }
        
    }
    
    func wrongAllert(controller: UIViewController, message: String = "please enter all the information") {
        let alert = UIAlertController(title: "Wrong Credientails",
                                      message: message,
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok",
                                      style: .cancel,
                                      handler: nil))
        controller.present(alert,
                           animated: true,
                           completion: nil)
    }
    
    @objc func proceed() {
        coordinator?.popBack()
    }
    
}


