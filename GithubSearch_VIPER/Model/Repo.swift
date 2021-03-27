//
//  Repo.swift
//  GithubSearch_VIPER
//
//  Created by 융융 on 2021/02/28.
//

import Foundation

import ObjectMapper

struct Repo {
  // 가져오고 싶으 값만 넣어봤습니당
  var fullName = ""
  var description = ""
  var htmlUrl = ""
}

extension Repo: Mappable {
  init?(map: Map) { }
  
  mutating func mapping(map: Map) {
    self.fullName <- map["full_name"]
    self.description <- map["description"]
    self.htmlUrl <- map["html_url"]
  }
}
