//
//  ContactsCoordinator.swift
//  Final_chatProject
//
//  Created by Baxva Jakeli on 26.07.21.
//

import UIKit

final class ContactsCoordinator: CoordinatorProtocol {
    
    var navigationController: UINavigationController?
    
    init(_ window: UIWindow? = nil, navigationController: UINavigationController? = UINavigationController()) {
        self.navigationController = navigationController
        self.navigationController?.isNavigationBarHidden = true
        
        let vc = ContactsViewController.instantiateFromStoryboard()
        vc.coordinator = self
        vc.tabBarItem.image = UIImage(named: "ic_contacts")
        vc.title = "Contacts"
        
        self.navigationController?.viewControllers = [vc]
    }
    
    
    
}
