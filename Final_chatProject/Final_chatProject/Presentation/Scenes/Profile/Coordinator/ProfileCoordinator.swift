//
//  ProfileCoordinator.swift
//  Final_chatProject
//
//  Created by Baxva Jakeli on 25.07.21.
//

import UIKit

final class ProfileCoordinator: CoordinatorProtocol {
    
    var navigationController: UINavigationController?
    
    init(_ window: UIWindow? = nil, navigationController: UINavigationController? = UINavigationController()) {
        self.navigationController = navigationController
        self.navigationController?.isNavigationBarHidden = true
        
        let vc = ProfileViewController.instantiateFromStoryboard()
        vc.coordinator = self
        vc.tabBarItem.image = UIImage(named: "ic_profile")
        vc.tabBarItem.title = "Profile"
        vc.title = "Profile"
        
        self.navigationController?.viewControllers = [vc]
    }
    
    
    
}
