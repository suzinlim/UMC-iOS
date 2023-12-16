//
//  FeedDataManager.swift
//  Catstagram
//
//  Created by 임수진 on 2023/12/07.
//

import Alamofire

class FeedDataManager {
    func feedDataManager(_ parameters : FeedAPIInput, _ viewController : HomeViewController) {
        AF.request("https://api.thecatapi.com/v1/images/search", method: .get, parameters: parameters).validate().responseDecodable(of: [FeedModel].self) { response in
            switch response.result {
            case .success(let result): // 성공할 경우
                viewController.sucessAPI(result)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
