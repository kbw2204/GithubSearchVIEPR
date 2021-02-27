//
//  SearchPresenter.swift
//  GithubSearch_VIPER
//
//  Created by 융융 on 2021/02/27.
//

import UIKit

import RxCocoa

final class SearchPresenter {
  weak var view: SearchViewProtocol?
  var interactor: SearchInteractorProtocol?
  var router: SearchRouterProtocol?
}

extension SearchPresenter: SearchPresenterProtocol {
  func viewDidLoad() {
    
  }
  
  func searchRepo() {
    
  }
  
  func didClickOnRepoCell(from view: UIViewController?) {
    
  }
}
