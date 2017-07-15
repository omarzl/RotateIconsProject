//
//  RotatingIconsView.swift
//  RotateIcons
//
//  Created by omarzl on 15/07/17.
//  Copyright © 2017 omarzl. All rights reserved.
//

import UIKit

class RotatingIconsView: OrientationView {

    // MARK: UI Attributes
    
    lazy var containerView : UIView = {
        let containerView=UIView()
        containerView.translatesAutoresizingMaskIntoConstraints=false
        containerView.backgroundColor = UIColor(red: 240.0/255.0, green: 270.0/255.0, blue: 87.0/255.0, alpha: 1.0)
        return containerView
    }()

    var iconViews = [UIImageView]()
    
    // MARK: Initializers

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    func setupView(){
        //View subviews
        addSubview(containerView)
        
        let cameraImage = UIImage(named: "cameraIcon.png")
        let cameraImageView = UIImageView(image: cameraImage)
        cameraImageView.translatesAutoresizingMaskIntoConstraints = false
        iconViews.append(cameraImageView)
        
        //containerView subviews
        containerView.addSubview(cameraImageView)

        // Constraints
        containerView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        containerView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        containerView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        containerView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        
        cameraImageView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
        cameraImageView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
        cameraImageView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        cameraImageView.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
