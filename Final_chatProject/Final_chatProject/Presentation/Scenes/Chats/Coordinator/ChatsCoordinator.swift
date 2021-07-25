//
//  ChatsCoordinator.swift
//  Final_chatProject
//
//  Created by Baxva Jakeli on 25.07.21.
//

import UIKit

final class ChatsCoordinator: CoordinatorProtocol {
    
    var navigationController: UINavigationController?
    
    init(_ window: UIWindow? = nil, navigationController: UINavigationController? = UINavigationController()) {
        self.navigationController = navigationController
        self.navigationController?.isNavigationBarHidden = true
        
        let vc = ChatsViewController.instantiateFromStoryboard()
        vc.coordinator = self
        vc.tabBarItem.image = UIImage(named: "ic_chat")
        vc.title = "Chat"
        
        self.navigationController?.viewControllers = [vc]
    }
    
    
}
