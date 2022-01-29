//
//  InfoViewController.swift
//  ScreenChange
//
//  Created by 강루비 on 2022/01/29.
//

import UIKit

class InfoViewController: UIViewController {
    
    // propertes
    var nameText: String?
    var colorText: String?
    
    // UI
    @IBOutlet weak var InfoNamesLabel: UILabel!
    @IBOutlet weak var InfoColorTextField: UITextField!
    
    // view life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        InfoNamesLabel.text = nameText
        InfoColorTextField.text = colorText
        
    }
    

}
