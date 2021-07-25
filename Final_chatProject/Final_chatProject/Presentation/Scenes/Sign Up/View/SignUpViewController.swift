//
//  SignUpViewController.swift
//  Final_chatProject
//
//  Created by Baxva Jakeli on 24.07.21.
//

import UIKit

class SignUpViewController: BaseViewController {
    
    private var viewModel: SignUpViewModelProtocol!

    @IBOutlet weak var backImg: UIImageView!
    @IBOutlet weak var profilePic: UIImageView!
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var surnameText: UITextField!
    @IBOutlet weak var mailText: UITextField!
    @IBOutlet weak var passText: UITextField!
    @IBOutlet weak var registerBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpProfilePic()
        configure()
        viewModel.setUpImg(with: backImg)
        viewModel.setUpButton(with: registerBtn)
        
    }
    
    @IBAction func onRegister(_ sender: Any) {
        
        viewModel.pressRegister(with: nameText, surname: surnameText, email: mailText, password: passText, controller: self)
    }
    
    
}
extension SignUpViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    private func configure() {
        viewModel = SignUpViewModel(with: self, coordinator: coordinator!)
    }
    
    func setUpProfilePic() {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(onProfile))
        profilePic.isUserInteractionEnabled = true
        profilePic.addGestureRecognizer(gesture)
    }
    
    func alert() {
        let alert = UIAlertController(title: "Profile picture",
                                      message: "",
                                      preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Cancel",
                                      style: .cancel,
                                      handler: nil))
        alert.addAction(UIAlertAction(title: "Take Photo",
                                      style: .default,
                                      handler: { [weak self] _ in
                                        self?.showCamera()
                                      }))
        alert.addAction(UIAlertAction(title: "Select photo",
                                      style: .default,
                                      handler: { [weak self] _ in
                                        self?.showPhotoPicker()
                                      }))
        present(alert, animated: true)

    }
    
    @objc func onProfile() {
        alert()
    }
    
    func showCamera() {
        let vc = UIImagePickerController()
        vc.sourceType = .camera
        vc.delegate = self
        vc.allowsEditing = true
        present(vc, animated: true, completion: nil)
    }
    
    func showPhotoPicker() {
        let vc = UIImagePickerController()
        vc.sourceType = .photoLibrary
        vc.delegate = self
        vc.allowsEditing = true
        present(vc, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage else {return}
        profilePic.image = image
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}
