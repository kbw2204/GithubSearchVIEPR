//
//  GithubService.swift
//  GithubSearch_VIPER
//
//  Created by 융융 on 2021/02/28.
//

import RxSwift
import Alamofire
import SwiftyJSON
import ObjectMapper

final class GithubService {
  private let baseURL = "https://api.github.com"
  
  func searchRepos(with keyword: String, page: Int = 1) -> Observable<[Repo]?> {
    let url = baseURL + "/search/repositories"
    let params: Parameters = [
      "q": keyword,
      "page": page
    ]
    let headers: HTTPHeaders = ["accept": "application/vnd.github.v3+json"]
    
    // 요런 네트워크서비스를 만들땐 주로 create로 Observable을 생성해줘용
    return .create() { subscriber in
      // keyword에 스페이스 등이 들어갈 수 있기 때문에, encoding 해주는게 좋아요
      guard
        let encodedURL = url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
      else {
        // 따로 커스텀 Error를 만들어서 onError로 넘겨주면 좋을 것 같아용
        return Disposables.create()
      }
      
      AF
        .request(encodedURL, method: .get, parameters: params, headers: headers)
        .responseData { response in
          switch response.result {
          case .success(let data):
            let json = JSON(data)
            let items = json["items"].arrayObject
            let repos = Mapper<Repo>().mapArray(JSONObject: items)
            subscriber.onNext(repos)
          case .failure(let error):
            subscriber.onError(error)
          }
        }
      return Disposables.create()
    }
  }
}
