//
//  LottoViewController.swift
//  Study240116
//
//  Created by SangRae Kim on 1/16/24.
//

import UIKit

struct Lotto: Codable {
    let drwNo: Int
    let drwNoDate: String
    let drwtNo1: Int
    let drwtNo2: Int
    let drwtNo3: Int
    let drwtNo4: Int
    let drwtNo5: Int
    let drwtNo6: Int
    let bnusNo: Int
}

class LottoViewController: UIViewController {

    @IBOutlet var numberTextField: UITextField!
    @IBOutlet var dateLabel: UILabel!
    
    let manager = LottoAPIManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        manager.callRequest(number: "1102") { value in
            self.dateLabel.text = value
        }
    }
    
    
    @IBAction func textFieldReturn(_ sender: UITextField) {
        manager.callRequest(number: numberTextField.text!) { value in
            self.dateLabel.text = value
        }
    }
}
