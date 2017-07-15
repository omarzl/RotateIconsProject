//
//  UIViewExtension.swift
//  RotateIcons
//
//  Created by omarzl on 15/07/17.
//  Copyright © 2017 omarzl. All rights reserved.
//

import UIKit

class OrientationView : UIView {

    private var portraitConstraints = [NSLayoutConstraint]()
    private var landscapeConstraints = [NSLayoutConstraint]()

    func update(orientation:UIInterfaceOrientation){
        var constraintsActive = portraitConstraints
        var constraintsInactive = landscapeConstraints
        if orientation != .portrait{
            constraintsActive = landscapeConstraints
            constraintsInactive = portraitConstraints
        }
        for constraint in constraintsInactive{
            constraint.isActive = false
        }
        for constraint in constraintsActive{
            constraint.isActive = true
        }
        
        for view in subviews{
            if let view = view as? OrientationView{
                view.update(orientation: orientation)
            }
        }
    }
    
    func addConstraint(constraint: NSLayoutConstraint,orientation:UIInterfaceOrientation){
        if orientation == .portrait{
            portraitConstraints.append(constraint)
        }else{
            landscapeConstraints.append(constraint)
        }
    }    
}
