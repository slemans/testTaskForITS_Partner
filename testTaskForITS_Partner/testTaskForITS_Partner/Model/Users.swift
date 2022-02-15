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
    let eyeColor, name, company: String
    var gender: Gender
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
        id = user.id
        index = user.index
        guid = user.guid
        isActive = user.isActive
        balance = user.balance
        picture = user.picture
        age = user.age
        eyeColor = user.eyeColor
        name = user.name
        gender = user.gender
        company = user.company
        email = user.email
        phone = user.phone
        address = user.address
        about = user.about
        registered = user.registered
        latitude = user.latitude
        longitude = user.longitude
        tags = user.tags
        friends = user.friends
        greeting = user.greeting
        favoriteFruit = user.favoriteFruit
    }
}

struct Friend: Codable {
    let id: Int
    let name: String
}

enum Gender: String, Codable {
    case male
    case female
}
