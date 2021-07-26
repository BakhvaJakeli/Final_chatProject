//
//  ContactsViewModel.swift
//  Final_chatProject
//
//  Created by Baxva Jakeli on 26.07.21.
//

import UIKit

protocol ContactsViewModelProtocol: AnyObject {
    init(with viewcontroller: UIViewController, coordinator: CoordinatorProtocol)
    

}

final class ContactsViewModel: ContactsViewModelProtocol {

    private weak var coordinator: CoordinatorProtocol?
    private weak var controller: UIViewController?
    
    init(with viewcontroller: UIViewController, coordinator: CoordinatorProtocol) {
        self.controller = viewcontroller
        self.coordinator = coordinator
    }
    
}
