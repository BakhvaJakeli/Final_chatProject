//
//  ProfileViewController.swift
//  Final_chatProject
//
//  Created by Baxva Jakeli on 25.07.21.
//

import UIKit
import FirebaseAuth

class ProfileViewController: BaseViewController {
    
    private var viewModel: ProfileViewModelProtocol!

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var mailLabel: UILabel!
    @IBOutlet weak var logOutBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
   
    
    @IBAction func onLogOut(_ sender: Any) {
        
        do {
            try FirebaseAuth.Auth.auth().signOut()
            viewModel.logOut(with: self)
            
        } catch {
            print(error.localizedDescription)
        }
    }
    
}


extension ProfileViewController {
    func configure() {
        viewModel = ProfileViewModel(with: self, coordinator: coordinator!)
    }
}
