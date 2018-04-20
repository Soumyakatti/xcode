//
//  ViewController.swift
//  Login
//
//  Created by Chanakya on 12/04/18.
//  Copyright © 2018 Chanakya. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func LoginPage(_ sender: UIButton) {
          performSegue(withIdentifier:"LoginPage", sender: self)
    }
    
}

