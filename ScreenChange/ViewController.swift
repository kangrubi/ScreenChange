//
//  ViewController.swift
//  ScreenChange
//
//  Created by 강루비 on 2022/01/29.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // properties
    var koNameArray: [String] = ["빨강", "주황", "노랑", "초록", "파랑", "남색", "보라색", "연두", "회색", "검정"]
    var enNameArray: [String] = ["red", "orange", "yellow", "green", "blue", "green", "purple", "lightGreen", "grey", "black"]
    var colorNumArray: [String] = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10"]
    
    // UI
    @IBOutlet weak var colorTableView: UITableView!
    
    // view life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorTableView.delegate = self
        colorTableView.dataSource = self
    }

    // UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return koNameArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ColorCell", for: indexPath) as? ColorTableViewCell else { return UITableViewCell() }
        
        let koName = koNameArray[indexPath.row]
        let enName = enNameArray[indexPath.row]
        let number = colorNumArray[indexPath.row]
        
        cell.colorKoName.text = koName
        cell.colorEnName.text = enName
        cell.colorNumber.text = number
        
        return cell
    }
    
    // UITablViewDelegate
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    // 행을 클릭 했을때
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let infoVC = self.storyboard?.instantiateViewController(withIdentifier: "InfoVC") as? InfoViewController else { return }
        
        infoVC.nameText = koNameArray[indexPath.row] + " = " + enNameArray[indexPath.row]
        infoVC.colorText = colorNumArray[indexPath.row]
        
        self.present(infoVC, animated: true, completion: nil)
    }
}
