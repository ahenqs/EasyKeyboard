//
//  EasyKeyboardViewController.swift
//  EasyKeyboard
//
//  Created by DA SILVA Andre Henrique on 21/12/2016.
//  Copyright © 2016 a h e n q s. All rights reserved.
//

import UIKit

class EasyKeyboardViewController: UIViewController, EasyKeyboardDelegate {

    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        addKeyboardObservers(viewController: self)
    }
    
    // MARK: EasyKeyboardDelegate
    
    func addKeyboardObservers(viewController: UIViewController) {
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.toggleKeyboard(_:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.toggleKeyboard(_:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    
    func toggleKeyboard(_ notification: Notification) {
        animateWithKeyboard(notification, viewController: self, constraint: bottomConstraint)
    }
    
    deinit {
        //removes all observers, subclasses will call it whenever necessary
        NotificationCenter.default.removeObserver(self)
    }

}
