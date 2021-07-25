//
//  ProfileViewModel.swift
//  Final_chatProject
//
//  Created by Baxva Jakeli on 26.07.21.
//

import UIKit

protocol ProfileViewModelProtocol: AnyObject {
    init(with viewcontroller: UIViewController, coordinator: CoordinatorProtocol)
    
    func logOut(with controller: UIViewController)

}

final class ProfileViewModel: ProfileViewModelProtocol {
    
    private weak var coordinator: CoordinatorProtocol?
    private weak var controller: UIViewController?
    
    init(with viewcontroller: UIViewController, coordinator: CoordinatorProtocol) {
        self.controller = viewcontroller
        self.coordinator = coordinator
    }
    
    func logOut(with controller: UIViewController) {
        let alert = UIAlertController(title: "Are you Sure?",
                                      message: "By loging out you will exit the App",
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Log Out and Quit",
                                      style: .destructive,
                                      handler: { _ in
            exit(0)
        }))
        controller.present(alert,
                           animated: true,
                           completion: nil)
    }
    
}
