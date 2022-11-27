//
//  DatabaseManager.swift
//  SNSPlayground
//
//  Created by 김민성 on 2022/11/24.
//

import FirebaseDatabase

class DatabaseManager {
    static let shared = DatabaseManager()
    private let database = Database.database(url: "https://snsplayground-db893-default-rtdb.asia-southeast1.firebasedatabase.app").reference()
    
    func canCreateNewUser(email:String, userName: String, completion: @escaping (Bool) -> Void) {
        //TODO: check if it's available
        completion(true)
    }
    
    
    
    func insertUser(email: String, userName: String, completion: @escaping (Bool) -> Void) {
        database.child(email.safeKey()).setValue(["userName": userName]) { error, _ in
            if error == nil {
                completion(true)
                return
            } else {
                //TODO: Error handling
                completion(false)
                return
            }
        }
    }
}
