//
//  MarketViewController.swift
//  Study240116
//
//  Created by SangRae Kim on 1/16/24.
//

import UIKit
import Alamofire

struct Market: Codable {
    let market: String
    let korean_name: String
    let english_name: String
}

class MarketViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    var list: [Market] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        callRequest()
        configureTableView()
    }
    
    func callRequest() {
        let url = "https://api.upbit.com/v1/market/all"
        
        AF.request(url).validate(statusCode: 200 ..< 501).responseDecodable(of: [Market].self) { response in
            switch response.result {
            case .success(let success):
                dump(success)
                if response.response?.statusCode == 200 {
                    self.list = success
                } else if response.response?.statusCode == 500 {
                    print("오류 발생!!")
                }
            case .failure(let failure):
                print(failure)
            }
        }
    }
}

extension MarketViewController: UITableViewDelegate, UITableViewDataSource {
    func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MarketTableViewCell", for: indexPath) as! MarketTableViewCell
        let data = list[indexPath.row]
        
        cell.textLabel?.text = data.korean_name
        cell.detailTextLabel?.text = data.english_name
        
        return cell
    }
}
