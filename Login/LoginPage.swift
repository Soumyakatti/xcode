//
//  LoginPage.swift
//  Login
//
//  Created by Chanakya on 12/04/18.
//  Copyright © 2018 Chanakya. All rights reserved.
//

import UIKit

class LoginPage: UIViewController {
    
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBAction func signin(_ sender: UIButton) {

        if(username.text=="Admin@gmail.com" && password.text=="1234")
        {
            performSegue(withIdentifier:"EnterPage", sender: self)
        }
        else{
            NSLog("Login Unsuccessfull")
        }
    }
    
}
