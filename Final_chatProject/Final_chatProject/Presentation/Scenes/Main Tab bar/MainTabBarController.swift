//
//  MainTabBarController.swift
//  Final_chatProject
//
//  Created by Baxva Jakeli on 25.07.21.
//

import UIKit

class MainTabBarController: UITabBarController, Storyboarded, CoordinatorDelegate {
   
    private var chatsCoordinator = ChatsCoordinator()
    private var contactsCoordinator = ContactsCoordinator()
    private var profilecoordinator = ProfileCoordinator()
    
    var coordinator: CoordinatorProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        viewControllers = [
            chatsCoordinator.navigationController!,
            contactsCoordinator.navigationController!,
            profilecoordinator.navigationController!
        ]
        
    }

}
