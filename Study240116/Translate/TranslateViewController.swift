//
//  TranslateViewController.swift
//  Study240116
//
//  Created by SangRae Kim on 1/17/24.
//

import UIKit

class TranslateViewController: UIViewController {
    
    @IBOutlet var sourceButton: UIButton!
    @IBOutlet var changeButton: UIButton!
    @IBOutlet var targetButton: UIButton!
    @IBOutlet var sourceTextView: UITextView!
    @IBOutlet var translateButton: UIButton!
    @IBOutlet var targetTextView: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
}

extension TranslateViewController {
    func configure() {
        navigationItem.title = "Translate"
        
        sourceButton.setTitle("한국어", for: .normal)
        sourceButton.tintColor = .black
        sourceButton.addTarget(self, action: #selector(setLanguage), for: .touchUpInside)
        
        changeButton.setImage(UIImage(systemName: "fibrechannel"), for: .normal)
        changeButton.tintColor = .black
        
        targetButton.setTitle("영어", for: .normal)
        targetButton.tintColor = .black
        targetButton.addTarget(self, action: #selector(setLanguage), for: .touchUpInside)
        
        sourceTextView.layer.borderWidth = 1
        sourceTextView.layer.borderColor = UIColor.black.cgColor
        
        translateButton.setTitle("번역하기", for: .normal)
        translateButton.tintColor = .black
        translateButton.addTarget(self, action: #selector(translateButtonClicked), for: .touchUpInside)
        
        targetTextView.layer.borderWidth = 1
        targetTextView.layer.borderColor = UIColor.black.cgColor
    }
    
    @objc func translateButtonClicked() {
        TranslateManager().callRequest(source: sourceTextView.text!) { translatedText in
            self.targetTextView.text = translatedText
        }
    }
    
    @objc func setLanguage() {
        let sb = UIStoryboard(name: "Language", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "LanguageViewController") as! LanguageViewController
        
        navigationController?.pushViewController(vc, animated: true)
    }
}
