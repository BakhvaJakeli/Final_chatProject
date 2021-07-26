//
//  ChatsViewModel.swift
//  Final_chatProject
//
//  Created by Baxva Jakeli on 26.07.21.
//

import UIKit

protocol ChatsViewModelProtocol: AnyObject {
    init(with viewcontroller: UIViewController, coordinator: CoordinatorProtocol)
    
    func fetchConvo()

}

final class ChatsViewModel: ChatsViewModelProtocol {

    private weak var coordinator: CoordinatorProtocol?
    private weak var controller: UIViewController?
    
    init(with viewcontroller: UIViewController, coordinator: CoordinatorProtocol) {
        self.controller = viewcontroller
        self.coordinator = coordinator
    }
    

    func fetchConvo() {}
}

