//
//  Contact.swift
//  FirebaseApplication
//
//  Created by Роман Важник on 17/10/2019.
//  Copyright © 2019 Роман Важник. All rights reserved.
//

import Foundation
import Firebase

struct Contact {
    
    let contactId: Int
    let userId: String
    let name: String
    let surname: String
    let reference: DatabaseReference?
    
    init(userId: String, name: String, surname: String) {
        self.contactId = Int(Date().timeIntervalSince1970)
        self.userId = userId
        self.name = name
        self.surname = surname
        reference = nil
    }
    
    init(snapshot: DataSnapshot) {
        let snapshotValue = snapshot.value as! [String: Any]
        self.contactId = snapshotValue["contactId"] as! Int
        self.userId = snapshotValue["userId"] as! String
        self.name = snapshotValue["name"] as! String
        self.surname = snapshotValue["surname"] as! String
        self.reference = snapshot.ref
    }
    
    func convertToDictionary() -> [String: Any] {
        return ["contactId": contactId, "userId": userId, "name": name, "surname": surname]
    }
}
