//
//  ViewController.swift
//  GithubSearch_VIPER
//
//  Created by 융융 on 2021/02/27.
//

import UIKit

import SnapKit
import Then

final class SearchView: UIViewController {
  var presenter: SearchPresenterProtocol?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    
  }
}

extension SearchView: SearchViewProtocol {
  func display() {
    
  }
}
