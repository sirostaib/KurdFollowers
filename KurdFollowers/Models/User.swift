//
//  User.swift
//  KurdFollowers
//
//  Created by Siros Taib on 4/21/24.
//

import Foundation

struct User: Codable {
    var login: String
    var avatarUrl: String
    var name: String?
    var location: String?
    var bio: String?
    var publicRepos: Int
    var publicGists: Int
    var followers: Int
    var following: Int
    var htmlUrl: String
    var createdAt: String
    
}
