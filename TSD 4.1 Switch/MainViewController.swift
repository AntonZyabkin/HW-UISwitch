//
//  MainViewController.swift
//  TSD 4.1 Switch
//
//  Created by Anton Zyabkin on 02.06.2022.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemGroupedBackground
        
        //MARK: - create new elements
        
        createLabel (label: fullNameLabel, coord: CGRect(x: 60, y: 100, width: 200, height: 30), text: "Ful name:", textColor: .black, backgroundColor: .clear, vC: self, textSize: 15)
        
        createLabel (label: numberOfGuesrsLabel, coord: CGRect(x: 60, y: 180, width: 200, height: 30), text: "Number of guesrs:", textColor: .black, backgroundColor: .clear, vC: self, textSize: 15)
        
        createLabel (label: numberOfTableLabel, coord: CGRect(x: 60, y: 260, width: 200, height: 30), text: "Table number:", textColor: .black, backgroundColor: .clear, vC: self, textSize: 15)
        
        createLabel (label: typeOfHollLabel, coord: CGRect(x: 60, y: 400, width: 200, height: 30), text: "Smoking hall", textColor: .black, backgroundColor: .clear, vC: self, textSize: 20)

        createLabel (label: prepayLabel, coord: CGRect(x: 60, y: 460, width: 200, height: 30), text: "To prepay?", textColor: .black, backgroundColor: .clear, vC: self, textSize: 20)

        createLabel (label: discountCardLabel, coord: CGRect(x: 60, y: 520, width: 200, height: 30), text: "Customer card", textColor: .black, backgroundColor: .clear, vC: self, textSize: 20)


        typeOfHollSwitch = UISwitch (frame: CGRect(x: 300, y: 400, width: 0, height: 0))
        prepaySwitch = UISwitch (frame: CGRect(x: 300, y: 460, width: 0, height: 0))
        discountCardSwitch = UISwitch (frame: CGRect(x: 300, y: 520, width: 0, height: 0))

        fullNameTextField = createTextField(coord: CGRect(x: 60, y: 130, width: 300, height: 40), plaseHolder: "input full name", vC: self, textSize: 20)
        fullNameTextField.center.x = 210
        
        numberOfGuesrsTextField = createTextField(coord: CGRect(x: 60, y: 210, width: 300, height: 40), plaseHolder: "how many guests will be?", vC: self, textSize: 20)
        numberOfGuesrsTextField.center.x = 210
        numberOfGuesrsTextField.keyboardType = .numberPad
        
        
        numberOfTableTextField = createTextField(coord: CGRect(x: 60, y: 290, width: 300, height: 40), plaseHolder: "input number of table", vC: self, textSize: 20)
        numberOfTableTextField.center.x = 210
        numberOfTableTextField.keyboardType = .numberPad

        regestrationButton = createButton(title: "ORDER", coord: CGRect(x: 100, y: 650, width: 300, height: 50), color: .red, vC: self, textSize: 40)
        regestrationButton.center.x = view.center.x
        
        
        view.addSubview(typeOfHollSwitch)
        view.addSubview(prepaySwitch)
        view.addSubview(discountCardSwitch)
        
        regestrationButton.addTarget(self, action: #selector(finalVC), for: .touchUpInside)

    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        fullNameTextField.resignFirstResponder()
        numberOfGuesrsTextField.resignFirstResponder()
        numberOfTableTextField.resignFirstResponder()
    }
    @objc func finalVC (button: UIButton) {
        animateView(button)
        if  fullNameTextField.text?.isEmpty ?? true ||
            numberOfGuesrsTextField.text?.isEmpty ?? true ||
            numberOfTableTextField.text?.isEmpty ?? true {
            alertWaring(title: "Sorry(", message: "some field is empty", stile: .alert, vC: self)
        } else {
            alertOrder (vC: self)
            print("here")
        }
    }
    
}
