//
//  File.swift
//  TSD 4.1 Switch
//
//  Created by Anton Zyabkin on 02.06.2022.
//

import Foundation
import UIKit

//MARK: - Labels
var cafeNameLabel = UILabel ()
let isEmptyLabel = UILabel ()
let wrongEmail = UILabel()

//MARK: - textFields
var passwordTextField = UITextField ()
var emailTextField = UITextField ()


//MARK: - Buttons

var singInButton = UIButton ()
var paddingView = UIButton(frame: CGRect(x: 0, y: 0, width: 25, height: 0))




func createTextField (coord: CGRect, plaseHolder: String, vC: UIViewController, textSize: Int) -> UITextField {
    let newTextField = UITextField ()
    newTextField.frame = coord
    newTextField.placeholder = "  " + plaseHolder
    newTextField.center.x = vC.view.center.x
    newTextField.font = UIFont(name: "AppleSymbols", size: CGFloat(textSize))
    newTextField.backgroundColor = UIColor.white
    newTextField.layer.cornerRadius = 8
    newTextField.textAlignment = .natural

    //Добавим наш  ТФ на вью
    vC.view.addSubview(newTextField)

    return newTextField
}


func createButton (title:  String, coord: CGRect, color: UIColor, vC: UIViewController, textSize: Int) -> UIButton {
    let newButton = UIButton (frame: coord)
    newButton.setTitle(title, for: .normal)
    newButton.backgroundColor = color
    newButton.titleLabel?.font = UIFont(name: "AppleSymbols", size: CGFloat(textSize))
    newButton.layer.cornerRadius = 8
    
    
    vC.view.addSubview(newButton)
    return newButton
}


//Создание лейбла
func createLabel (label : UILabel, coord : CGRect, text: String, textColor : UIColor, backgroundColor: UIColor, vC: UIViewController, textSize: Int) -> Void {
    label.frame = coord
    label.text = text
    label.textAlignment = .left
    label.font = .systemFont(ofSize: CGFloat(textSize))
    label.textColor = textColor
    label.backgroundColor = backgroundColor
    vC.view.addSubview(label)
}

//MARK: - functions
func checkTextField (vC: UIViewController) {

    if  (passwordTextField.text?.isEmpty)! ||
        (emailTextField.text?.isEmpty)! {
        createLabel(label: isEmptyLabel, coord: CGRect(x: 50, y: emailTextField.center.y + 15, width: 300, height: 40), text: "pleace, enter all data", textColor: .red, backgroundColor: .clear, vC: vC, textSize: 20 )
        isEmptyLabel.textAlignment = .center
        
    } else {
        
        checkEmailTF(vC: vC)
        isEmptyLabel.text = ""
    }
}


func checkEmailTF (vC: UIViewController) {
    
    for i in emailTextField.text! {
        
        if i == "@" {
            
            wrongEmail.text = ""
            goEnterVC (vC: vC)
            break
            
        } else {
            isEmptyLabel.text = ""
            createLabel(label: wrongEmail, coord: CGRect(x: 0, y: emailTextField.center.y + 15, width: 400, height: 30), text: "wrong e-mail", textColor: .red, backgroundColor: .clear, vC: vC, textSize: 24)
            vC.view.addSubview(wrongEmail)
            wrongEmail.textAlignment = .center
        }
    }
}

func animateView (_ viewToAnimate : UIView) {
    UIView.animate(withDuration: 0.05, delay: 0, usingSpringWithDamping: 20, initialSpringVelocity: 0.5, options: .curveEaseIn, animations: {
        viewToAnimate.transform = CGAffineTransform (scaleX: 0.95, y: 0.95)
        
    }) { (_) in
        UIView.animate(withDuration: 0.15, delay: 0, usingSpringWithDamping: 0.4, initialSpringVelocity: 2, options: .curveEaseIn, animations: {
            viewToAnimate.transform = CGAffineTransform (scaleX: 1, y: 1)
            
        }, completion: nil)
        
    }
}


func goEnterVC (vC: UIViewController) {
    let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
    guard let nextScreen = mainStoryboard.instantiateViewController(identifier: "MainViewController") as? MainViewController else {return}
    nextScreen.modalPresentationStyle = .fullScreen
    vC.show(nextScreen, sender: nil)
}
