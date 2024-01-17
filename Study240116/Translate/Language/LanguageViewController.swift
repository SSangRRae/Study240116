//
//  LanguageViewController.swift
//  Study240116
//
//  Created by SangRae Kim on 1/17/24.
//

import UIKit

struct Language {
    let language = ["ko": "한국어", "en": "영어", "ja": "일본어", "zh-CN": "중국어 간체", "zh-TW": "중국어 번체", "vi": "베트남어", "id": "인도네시아어", "th": "태국어", "de": "독일어", "ru": "러시아어", "es": "스페인어", "it": "이탈리아어", "fr": "프랑스어"]
    
    var returnTitle: [String] {
        var title: [String] = []
        for (_, value) in language {
            title.append(value)
        }
        return title
    }
}

class LanguageViewController: UIViewController {
    @IBOutlet var tableView: UITableView!
    
    let list = Language().returnTitle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTableView()
    }
}

extension LanguageViewController: UITableViewDelegate, UITableViewDataSource {
    func configureTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        
        let xib = UINib(nibName: "LanguageTableViewCell", bundle: nil)
        tableView.register(xib, forCellReuseIdentifier: "LanguageTableViewCell")
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LanguageTableViewCell", for: indexPath) as! LanguageTableViewCell
        
        cell.languageLabel.text = list[indexPath.row]
        
        return cell
    }
}
