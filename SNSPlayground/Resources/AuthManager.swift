//
//  AuthManager.swift
//  SNSPlayground
//
//  Created by 김민성 on 2022/11/24.
//

import FirebaseAuth

class AuthManager {
    
    static let shared = AuthManager()
    
    
    public func registerNewUser(email: String, userName: String, password: String, completion: @escaping (Bool) -> Void){
        DatabaseManager.shared.canCreateNewUser(email: email, userName: userName){ canCreate in
            if canCreate {
                Auth.auth().createUser(withEmail: email, password: password){ success, error in
                    guard success != nil, error == nil else{
                        completion(false)
                        return
                    }
                    
                    DatabaseManager.shared.insertUser(email: email, userName: userName) { inserted in
                        if inserted {
                            completion(true)
                            return
                        }else{
                            //TODO: Error handling
                            //TODO: Undo Auth.auth().createUser() because user has been made in auth but database failed
                            completion(false)
                            return
                        }
                    }
                    
                }
            } else {
                completion(false)
            }
        }
    }
    
    public func loginUser(userName: String?, email: String?, password: String, completion: @escaping (Bool) -> Void){
        
        if let email = email {
            Auth.auth().signIn(withEmail: email, password: password){ result, error in
                guard result != nil, error == nil else {
                    completion(false)
                    return
                }
                completion(true)
                
            }
        }else if let userName = userName {
            Auth.auth().signIn(withEmail: userName, password: password){ _, _ in
                
            }
        }
        
    }
    
    public func logoutUser(completion: (Bool) -> Void) {
        do {
            try Auth.auth().signOut()
            completion(true)
            return
        } catch {
            print(error)
            completion(false)
            return
        }
    }
}
