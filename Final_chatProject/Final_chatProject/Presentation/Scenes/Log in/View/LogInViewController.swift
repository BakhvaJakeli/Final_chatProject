//
//  LogInViewController.swift
//  Final_chatProject
//
//  Created by Baxva Jakeli on 24.07.21.
//

import UIKit

class LogInViewController: BaseViewController{
    
    private var viewModel: LogInViewModelProtocoll!

    @IBOutlet weak var mailText: UITextField!
    @IBOutlet weak var passText: UITextField!
    @IBOutlet weak var logInBtn: UIButton!
    @IBOutlet weak var signUpText: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        configureDataSource()
        viewModel.setUpButton(with: logInBtn)
        
//        let attributedString = NSMutableAttributedString(string: "Not part of our community? ")
//        attributedString.addAttribute(.font, value: UIFont.systemFont(ofSize: 19) , range: _NSRange (location: 0,length: attributedString.length))
//
//        let text = NSMutableAttributedString(string: "Click here!")
//        text.addAttribute(.font, value: UIFont.systemFont(ofSize: 19) , range: _NSRange (location: 0,length: text.length))
//        text.addAttribute(.underlineStyle, value: 1, range: _NSRange (location: 0, length: text.length))
//        text.addAttribute(.underlineColor, value: UIColor.blue, range:  _NSRange (location: 0, length: text.length))
//        text.addAttribute(.link, value: "click here", range:  _NSRange (location: 0, length: text.length))
//        attributedString.append(text)
//
//        let paragraphStyle = NSMutableParagraphStyle()
//        paragraphStyle.alignment = .center
//        attributedString.addAttribute(.paragraphStyle, value: paragraphStyle, range: _NSRange(location: 0, length: attributedString.length))
//
//        signUpText.attributedText = attributedString
//        signUpText.isEditable = false
//        signUpText.isSelectable = true
//        signUpText.delegate = self

    }
    
    
    @IBAction func onLogIn(_ sender: Any) {
        viewModel.pressLogIn(with: mailText, textTwo: passText, controller: self)
//        coordinator?.proceedToTabBar()
    }
    
    @IBAction func onSignup(_ sender: Any) {
        coordinator?.proceedToSignUp()
        
    }
    
   
}

extension LogInViewController {
    private func configureDataSource() {
        viewModel = LogInViewModel(with: self, coordinator: coordinator!)
    }
    
    
}
