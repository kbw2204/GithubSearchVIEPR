//
//  SearchProtocols.swift
//  GithubSearch_VIPER
//
//  Created by 융융 on 2021/02/27.
//

import UIKit

import RxCocoa

protocol SearchViewProtocol: class {
  var presenter: SearchPresenterProtocol? { get }
  
  func display() // view를 그림
}

protocol SearchPresenterProtocol: class {
  var view: SearchViewProtocol? { get }
  var interactor: SearchInteractorProtocol? { get }
  var router: SearchRouterProtocol? { get }
  
  func viewDidLoad() // 뷰가 로드될 때, 주로 interactor에서 초기값 가져와서 뷰 업데이트
  func searchRepo() // repo를 검색
  
  func didClickOnRepoCell(from view: UIViewController?) // repo 탭시
}

protocol SearchInteractorProtocol {
  var presenter: SearchPresenterProtocol? { get }
   
  func fetchData() // 초기 데이터 가져오기
  func updateData() // 데이터 업데이트
}

protocol SearchRouterProtocol {
  static func createModule() -> SearchView // VIPER통에 넣은 View return
  
  func pushDetailView(from view: UIViewController?) // 디테일뷰로 이동
}
