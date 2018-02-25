//
//  ViewController.swift
//  LoginValidationReact
//
//  Created by Bruno Lopes de Mello on 25/02/18.
//  Copyright © 2018 Bruno Lopes de Mello. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButtom: UIButton!
    @IBOutlet weak var loginEnabledLabel: UILabel!
    
    var loginViewModel = LoginViewModel()
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //this tells to the observer that these fields have changed
       _ = emailTextField.rx.text.map { $0 ?? ""}.bind(to: loginViewModel.emailText)
       _ = passwordTextField.rx.text.map { $0 ?? ""}.bind(to: loginViewModel.passwordText)
        
        _ = loginViewModel.isValid.bind(to: loginButtom.rx.isEnabled)
        
        loginViewModel.isValid.subscribe(onNext: { [unowned self] isValid in
            self.loginEnabledLabel.text = isValid ? "Enabled" : "Not Enabled"
            self.loginEnabledLabel.textColor = isValid ? UIColor.green : UIColor.red
            print(isValid)
        }).disposed(by: disposeBag)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

