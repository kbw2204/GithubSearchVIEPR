//
//  ViewController.swift
//  GithubSearch_VIPER
//
//  Created by 융융 on 2021/02/27.
//

import UIKit

import SnapKit
import Then
import RxSwift

final class SearchView: UIViewController {
  var presenter: SearchPresenterProtocol?
  let disposeBag = DisposeBag()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // 임시
    GithubService()
      .searchRepos(with: "rxSwift")
      .compactMap { $0 }
      .subscribe(onNext: { repos in
        for repo in repos {
          print(repo.fullName)
        }
      }).disposed(by: self.disposeBag)
  }
}

extension SearchView: SearchViewProtocol {
  func display() {
    
  }
}
