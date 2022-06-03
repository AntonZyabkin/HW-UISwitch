//
//  File.swift
//  TSD 4.1 Switch
//
//  Created by Anton Zyabkin on 02.06.2022.
//

import Foundation
import UIKit

var fullNameLabel = UILabel ()
var numberOfGuesrsLabel = UILabel ()
var numberOfTableLabel = UILabel ()
var typeOfHollLabel = UILabel ()
var prepayLabel = UILabel ()
var discountCardLabel = UILabel ()

var typeOfHollSwitch = UISwitch ()
var prepaySwitch = UISwitch ()
var discountCardSwitch = UISwitch ()

var fullNameTextField = UITextField ()
var numberOfGuesrsTextField = UITextField ()
var numberOfTableTextField = UITextField ()


var regestrationButton = UIButton ()

var orderAlert = UIAlertController ()

func goFinalVC (vC: UIViewController) {
    let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
    guard let nextScreen = mainStoryboard.instantiateViewController(identifier: "FinalViewController") as? FinalViewController else {return}
    nextScreen.modalPresentationStyle = .fullScreen
    vC.show(nextScreen, sender: nil)
}

func alertWaring (title: String, message: String, stile: UIAlertController.Style, vC: UIViewController) {
    let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
    let action = UIAlertAction(title: "OK", style: .default)
    alertController.addAction(action)
    vC.present(alertController, animated: true)
    
}


func alertOrder (vC: UIViewController) {
    let orderAlert = UIAlertController (title: "Are you sure?", message: nil, preferredStyle: .alert)
    let okAction = UIAlertAction (title: "Go!", style: .default) {_ in
        goFinalVC(vC: vC)
    }
    let cansleAction = UIAlertAction (title: "Cansle", style: .cancel)
    
    orderAlert.addAction(okAction)
    orderAlert.addAction(cansleAction)
    vC.present(orderAlert, animated: true)

}
