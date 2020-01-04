//
//  LVBaseViewController.swift
//  LovenApp
//
//  Created by Akshay Gohel on 2020-01-03.
//  Copyright © 2020 Akshay Gohel. All rights reserved.
//

import UIKit

class LVBaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    func delay(delay:Double, closure:@escaping ()->()) {
        let when = DispatchTime.now() + delay
        DispatchQueue.main.asyncAfter(deadline: when, execute: closure)
    }

}
