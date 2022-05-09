//
//  SplashViewController.swift
//  anime
//
//  Created by so on 2022/05/09.
//

import UIKit

class SplashViewController: UIViewController {

    @IBOutlet weak var imageview: UIImageView!
    @IBOutlet weak var leadingConstraint: NSLayoutConstraint!
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        UIView.animate(withDuration: 2, delay: 0, options: .curveEaseInOut) {
            self.leadingConstraint.constant = -(self.imageview.frame.width - self.view.frame.width)
            self.view.layoutIfNeeded()
        }completion: { _ in
            let mainStory = UIStoryboard(name: "Main", bundle: nil)
            let viewcontroller = mainStory.instantiateInitialViewController()
            UIApplication.shared.keyWindow?.rootViewController = viewcontroller
        }
        }

    }
