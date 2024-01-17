//
//  LottoAPIManager.swift
//  Study240116
//
//  Created by SangRae Kim on 1/16/24.
//

import UIKit
import Alamofire

struct LottoAPIManager {
    func callRequest(number: String, completionHandler: @escaping (String) -> Void) {
        let url = "https://www.dhlottery.co.kr/common.do?method=getLottoNumber&drwNo=\(number)"
        AF.request(url, method: .get).responseDecodable(of: Lotto.self) { response in
            switch response.result {
            case .success(let success):
                print(success)
                // self.dateLabel.text = success.drwNoDate
                completionHandler(success.drwNoDate)
            case .failure(let failure):
                print("오류 발생: \(failure)")
            }
            }
    }
}
