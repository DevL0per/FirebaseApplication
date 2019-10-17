//
//  User.swift
//  FirebaseApplication
//
//  Created by Роман Важник on 17/10/2019.
//  Copyright © 2019 Роман Важник. All rights reserved.
//

import Foundation
import Firebase

struct User {
    
    let userId: String
    let email: String
    
    init(user: Firebase.User) {
        self.userId = user.uid
        self.email = user.email!
    }
    
}
