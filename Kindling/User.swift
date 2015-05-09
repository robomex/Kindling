//
//  User.swift
//  Kindling
//
//  Created by Tony Morales on 5/8/15.
//  Copyright (c) 2015 Tony Morales. All rights reserved.
//

import Foundation

struct User {
    let id: String
    let pictureURL: String
    let name: String
    private let pfUser: PFUser
}

private func pfUserToUser(user: PFUser) -> User {
    return User(id: user.objectId!, pictureURL: user.objectForKey("picture") as! String, name: user.objectForKey("firstName") as! String, pfUser: user)
}

func currentUser() -> User? {
    if let user = PFUser.currentUser() {
        return pfUserToUser(user)
    }
    return nil
}