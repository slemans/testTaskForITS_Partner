//
//  Users.swift
//  testTaskForITS_Partner
//
//  Created by sleman on 3.01.22.
//

import UIKit

struct User: Codable {
    let id: String
    let index: Int
    let guid: String
    let isActive: Bool
    let balance: String
    let picture: String
    let age: Int
    let eyeColor, name, gender, company: String
    let email, phone, address, about: String
    let registered: String
    let latitude, longitude: Double
    let tags: [String]
    let friends: [Friend]
    let greeting, favoriteFruit: String

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case index, guid, isActive, balance, picture, age, eyeColor, name, gender, company, email, phone, address, about, registered, latitude, longitude, tags, friends, greeting, favoriteFruit
    }
    
    init?(user: User) {
        self.id = user.id
        self.index = user.index
        self.guid = user.guid
        self.isActive = user.isActive
        self.balance = user.balance
        self.picture = user.picture
        self.age = user.age
        self.eyeColor = user.eyeColor
        self.name = user.name
        self.gender = user.gender
        self.company = user.company
        self.email = user.email
        self.phone = user.phone
        self.address = user.address
        self.about = user.about
        self.registered = user.registered
        self.latitude = user.latitude
        self.longitude = user.longitude
        self.tags = user.tags
        self.friends = user.friends
        self.greeting = user.greeting
        self.favoriteFruit = user.favoriteFruit
    }
}

struct Friend: Codable {
    let id: Int
    let name: String
}
