//
//  ArticleDataModel.swift
//  Jet2TT
//
//  Created by Dhanraj Bhandari on 16/06/20.
//  Copyright © 2020 Dhanraj Bhandari. All rights reserved.
//

import Foundation


// MARK: - ArticleDataModel
struct ArticleDataModel: Codable {
    let id, createdAt, content: String
    let comments, likes: Int
    let media: [Media]
    let user: [User]
}

// MARK: - Media
struct Media: Codable {
    let id, blogID, createdAt: String
    let image: String
    let title: String
    let url: String

    enum CodingKeys: String, CodingKey {
        case id
        case blogID = "blogId"
        case createdAt, image, title, url
    }
}

// MARK: - User
struct User: Codable {
    let id, blogID, createdAt, name: String
    let avatar: String
    let lastname, city, designation, about: String

    enum CodingKeys: String, CodingKey {
        case id
        case blogID = "blogId"
        case createdAt, name, avatar, lastname, city, designation, about
    }
}

