//
//  FinalViewController.swift
//  TSD 4.1 Switch
//
//  Created by Anton Zyabkin on 02.06.2022.
//

import UIKit

class FinalViewController: UIViewController {
    var orderInfoLabel = UILabel ()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createLabel(label: orderInfoLabel, coord: CGRect (x: view.center.x - 180, y: 300, width: 360, height: 300), text: "", textColor: .label, backgroundColor: .systemBackground, vC: self, textSize: 30)
        
        view.addSubview(orderInfoLabel)
        orderInfo()
        orderInfoLabel.textAlignment = .center
        orderInfoLabel.numberOfLines = 0
    }
    
    fileprivate func orderInfo () {
        orderInfoLabel.text = "Dear \((fullNameTextField.text)!), you ordered table number \((numberOfTableTextField.text)!) for \((numberOfGuesrsTextField.text)!) guests\nSee you soon!"
    }
}
