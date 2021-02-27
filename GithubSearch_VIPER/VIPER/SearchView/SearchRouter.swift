//
//  SearchRouter.swift
//  GithubSearch_VIPER
//
//  Created by 융융 on 2021/02/27.
//

import UIKit

final class SearchRouter { }

extension SearchRouter: SearchRouterProtocol {
  static func createModule() -> SearchView {
    let view = SearchView()
    let presenter = SearchPresenter()
    let interactor = SearchInteractor()
    let router = SearchRouter()
    
    view.presenter = presenter
    
    presenter.view = view
    presenter.interactor = interactor
    presenter.router = router
    
    interactor.presenter = presenter
    
    return view
  }
  
  func pushDetailView(from view: UIViewController?) {
    
  }
}
