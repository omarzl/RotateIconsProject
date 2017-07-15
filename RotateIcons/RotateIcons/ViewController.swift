//
//  ViewController.swift
//  RotateIcons
//
//  Created by omarzl on 15/07/17.
//  Copyright © 2017 omarzl. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: UI Attributes

    private lazy var rotatingIconsView : RotatingIconsView = {
        let rotatingIconsView = RotatingIconsView()
        rotatingIconsView.translatesAutoresizingMaskIntoConstraints=false
        return rotatingIconsView
    }()
    
    // MARK: Initializers
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupConstraints()
    }
    
    func setupView(){
        view.addSubview(rotatingIconsView)
    }
    
    func setupConstraints(){
        
        //Common constraints
        rotatingIconsView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        rotatingIconsView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        
        //Portrait constraints
        rotatingIconsView.addConstraint(constraint: rotatingIconsView.rightAnchor.constraint(equalTo: view.rightAnchor), orientation: .portrait)
        rotatingIconsView.addConstraint(constraint: rotatingIconsView.heightAnchor.constraint(equalToConstant: 100), orientation: .portrait)

        //Landscape constraints
        rotatingIconsView.addConstraint(constraint: rotatingIconsView.bottomAnchor.constraint(equalTo: view.bottomAnchor), orientation: .landscapeLeft)
        rotatingIconsView.addConstraint(constraint: rotatingIconsView.widthAnchor.constraint(equalToConstant: 100), orientation: .landscapeLeft)

        //Force the update of rotation based on current orientation
        rotatingIconsView.update(orientation: UIApplication.shared.statusBarOrientation)
    }

    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        coordinator.animate(alongsideTransition: { [weak self] (context) in
            
            //Update of constraints according to orientation
         self?.rotatingIconsView.update(orientation: UIApplication.shared.statusBarOrientation)
        }) { (context) in
        }
        
        super.viewWillTransition(to: size, with: coordinator)
    }

}

