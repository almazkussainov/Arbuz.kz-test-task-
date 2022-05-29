//
//  ViewController.swift
//  Arbuz
//
//  Created by Алмаз Кусаинов on 28.05.2022.
//

import UIKit
import SwiftUI

class ViewController: UIViewController {
    
    lazy var childViewController: UIHostingController<MenuView> =  {
        let view = MenuView()
        return UIHostingController(rootView: view)
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        addChild(childViewController)
        view.addSubview(childViewController.view)
        
        
        childViewController.view.translatesAutoresizingMaskIntoConstraints = false
        let horizontalConstraint = childViewController.view.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        let verticalConstraint = childViewController.view.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        let widthConstraint = childViewController.view.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width)
        let heightConstraint = childViewController.view.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height)
        view.addConstraints([horizontalConstraint, verticalConstraint, widthConstraint, heightConstraint])
    }
}

