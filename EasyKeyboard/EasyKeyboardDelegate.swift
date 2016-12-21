//
//  EasyKeyboardDelegate.swift
//  EasyKeyboard
//
//  Created by DA SILVA Andre Henrique on 21/12/2016.
//  Copyright © 2016 a h e n q s. All rights reserved.
//

import UIKit

protocol EasyKeyboardDelegate: class {
    
    func addKeyboardObservers(viewController: UIViewController)
    func animateWithKeyboard(_ notification: Notification, viewController: UIViewController, constraint: NSLayoutConstraint)
}

extension EasyKeyboardDelegate {
    
    func animateWithKeyboard(_ notification: Notification, viewController: UIViewController, constraint: NSLayoutConstraint) {
        
        if let userInfo = (notification as NSNotification).userInfo {
            let keyboardHeight = (userInfo[UIKeyboardFrameEndUserInfoKey] as! NSValue).cgRectValue.height
            let duration = userInfo[UIKeyboardAnimationDurationUserInfoKey] as! Double
            let curve = userInfo[UIKeyboardAnimationCurveUserInfoKey] as! UInt
            let moveUp = (notification.name == NSNotification.Name.UIKeyboardWillShow)
            
            constraint.constant = moveUp ? keyboardHeight + 4.0 : 20.0 // + 4.0 gives some space for keyboard and 20.0 is the initial constraint value when no keyboard is shown
            
            let options = UIViewAnimationOptions(rawValue: curve << 16)
            UIView.animate(withDuration: duration, delay: 0, options: options,
                           animations: {
                            viewController.view.layoutIfNeeded()
            },
                           completion: nil
            )
        }
    }
}

