//
//  ViewController.swift
//  TSD 4.1 Switch
//
//  Created by Anton Zyabkin on 11.05.2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor =  .systemIndigo
        
        //MARK: - create new elements
        createLabel(label: cafeNameLabel, coord: CGRect(x: view.center.x, y: 200, width: 250, height: 30), text: "VESUVIO", textColor: .black, backgroundColor: .clear, vC: self, textSize: 40)
        cafeNameLabel.center.x = view.center.x
        cafeNameLabel.textAlignment = .center
        
        let singInButton = createButton(title: "sing in", coord: CGRect(x: view.center.x - 150, y: 490, width: 300, height: 40), color: .red, vC: self, textSize: 35)
        emailTextField = createTextField(coord: CGRect(x: view.center.x - 150, y: 350, width: 300, height: 40), plaseHolder: "input e-mail", vC: self, textSize: 24)
        passwordTextField = createTextField(coord: CGRect(x: view.center.x - 150, y: 420, width: 300, height: 40), plaseHolder: "input password", vC: self, textSize: 24)
        
        

        //MARK: - setting views
        paddingView.setImage(UIImage(systemName: "eye.slash")?.withRenderingMode(.alwaysTemplate), for: .normal)
        passwordTextField.rightView = paddingView
        passwordTextField.rightViewMode = UITextField.ViewMode.always
        passwordTextField.isSecureTextEntry = true

        
        
        //MARK: - Actions targer
        singInButton.addTarget(self, action: #selector(singingFunc), for: .touchUpInside)
        paddingView.addTarget(self, action: #selector(securePassword), for: .touchUpInside)
        emailTextField.keyboardType = .emailAddress
        
        

    }
//MARK: - methods

    
    //действие после нажатия на кнопку входа
    @objc func singingFunc (button : UIButton) {
        animateView(button)
        checkTextField (vC: self)
    }
    
    // скрыть/показать пароль, изменить при этом иконку кнопки
    @objc func securePassword () {
        passwordTextField.isSecureTextEntry.toggle()
        
        if passwordTextField.isSecureTextEntry {
            paddingView.setImage(UIImage(systemName: "eye")?.withRenderingMode(.alwaysOriginal), for: .normal)
            passwordTextField.isSecureTextEntry = false
        } else {
            paddingView.setImage(UIImage(systemName: "eye.slash")?.withRenderingMode(.alwaysOriginal), for: .normal)
            passwordTextField.isSecureTextEntry = true
        }
        paddingView.tintColor = .systemBlue

        passwordTextField.isSecureTextEntry = !passwordTextField.isSecureTextEntry
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        emailTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
    }

}

