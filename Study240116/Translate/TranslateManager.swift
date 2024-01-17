//
//  TranslateManager.swift
//  Study240116
//
//  Created by SangRae Kim on 1/17/24.
//

import UIKit
import Alamofire

struct Papago: Codable {
    let message: Message
}

struct Message: Codable {
    let result: Result
}

struct Result: Codable {
    let srcLangType: String
    let tarLangType: String
    let translatedText: String
}

struct TranslateManager {
    func callRequest(source: String, completionHandler: @escaping (String) -> Void) {
        let url = "https://openapi.naver.com/v1/papago/n2mt"
        let parmaeters: Parameters = ["text": source,
                                      "source": "ko",
                                      "target": "en"]
        let headers: HTTPHeaders = ["X-Naver-Client-Id": APIKey.naverClientID,
                                    "X-Naver-Client-Secret": APIKey.naverSecret]
        
        AF.request(url, method: .post, parameters: parmaeters, headers: headers).responseDecodable(of: Papago.self) { response in
            switch response.result {
            case .success(let success):
                dump(success)
                completionHandler(success.message.result.translatedText)
            case .failure(let failure):
                print(failure)
            }
        }
    }
}
