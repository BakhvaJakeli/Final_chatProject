//
//  WelcomeViewModel.swift
//  Final_chatProject
//
//  Created by Baxva Jakeli on 24.07.21.
//

import UIKit

protocol WelcomeViewModelProtocol: AnyObject {
    init(with viewcontroller: UIViewController)
    
    func animate(with view: UIView, with firstLabel: UILabel, with secondLabel: UILabel, button: UIButton, controller: UIViewController)
    
    func setUpButton(with button: UIButton)
}

final class WelcomeViewModel: WelcomeViewModelProtocol {
   
    private weak var controller: UIViewController?
    
    init(with viewcontroller: UIViewController) {
        self.controller = viewcontroller
    }
    
    func animate(with view: UIView, with firstLabel: UILabel, with secondLabel: UILabel, button: UIButton, controller: UIViewController) {
        UIView.animate(withDuration: 1,
                       delay: 0,
                       options: [.curveEaseOut]) {
            view.frame = CGRect(x: view.frame.minX,
                                              y: 100,
                                              width: view.frame.width,
                                              height: view.frame.height)
        } completion: { _ in
            UIView.animate(withDuration: 1) {
                firstLabel.alpha = 1
                firstLabel.frame = CGRect(x: 50,
                                          y: controller.view.frame.midY - 50,
                                          width: firstLabel.frame.width,
                                          height: firstLabel.frame.height)
            }
            
            UIView.animate(withDuration: 1,
                           delay: 0.5,
                           options: [.curveEaseOut]) {
                secondLabel.alpha = 1
                secondLabel.frame = CGRect(x: 60,
                                          y: controller.view.frame.midY + 30,
                                          width: secondLabel.frame.width,
                                          height: secondLabel.frame.height)
                
            } completion: { _ in
                UIView.animate(withDuration: 0.6,
                               delay: 1,
                               options: [.curveEaseIn]) {
                    button.alpha = 1
                }
            }
        }

    }
    
    func setUpButton(with button: UIButton) {
        button.layer.cornerRadius = button.frame.height / 3
        button.layer.borderWidth  = 2
        button.layer.borderColor = UIColor.black.cgColor
    }
    
    
}
