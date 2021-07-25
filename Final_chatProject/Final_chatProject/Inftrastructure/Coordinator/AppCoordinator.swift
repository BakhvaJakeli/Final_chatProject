//
//  AppCoordinator.swift
//  MapKitTeamWork
//
//  Created by MacBook  on 07.07.21.
//

import UIKit
import FirebaseAuth

final class AppCoordinator: CoordinatorProtocol {
    
    // MARK: - Private properties
    private var window: UIWindow?
    private var navigationController: UINavigationController?
    
    // MARK: - Internal properties
    
    
    init(_ window: UIWindow?, navigationController: UINavigationController?) {
        self.window = window
        self.navigationController = navigationController
    }
    
    func start() {
        
        if FirebaseAuth.Auth.auth().currentUser == nil {
            let vc = WelcomeViewController.instantiateFromStoryboard()
            vc.coordinator = self
            navigationController?.pushViewController(vc, animated: true)
        } else {
            let vc = MainTabBarController.instantiateFromStoryboard()
            vc.coordinator = self
            navigationController?.pushViewController(vc, animated: true)
        }
        
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
    
    func proceedTologIn() {
        let vc = LogInViewController.instantiateFromStoryboard()
        vc.coordinator = self
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func proceedToSignUp() {
        let vc = SignUpViewController.instantiateFromStoryboard()
        vc.coordinator = self
        navigationController?.pushViewController(vc, animated: true)
    }

    func popBack() {
        navigationController?.popViewController(animated: true)
    }

    func proceedToTabBar() {
        let vc = MainTabBarController.instantiateFromStoryboard()
        vc.coordinator = self
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func backToLogin() {
        let vc = LogInViewController.instantiateFromStoryboard()
        vc.coordinator = self
        navigationController?.popToViewController(vc, animated: true)
    }
}

