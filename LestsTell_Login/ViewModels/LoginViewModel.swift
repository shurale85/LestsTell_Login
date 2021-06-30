//
//  LoginViewModel.swift
//  LestsTell_Login
//
//  Created by NewUSER on 28.06.2021.
//

import Foundation

class LoginViewModel: ObservableObject {
    var username = ""
    var password = ""
    
    @Published var isAuthenticated = false
    
    func login(){
        
        let userDefaults = UserDefaults.standard
        
        WebService().login(username: username, password: password) { result in
            
            switch result {
            case.success(let token):
                print(token)
                userDefaults.setValue(token, forKey: "jwt")
                userDefaults.setValue(true, forKey: "status")
                NotificationCenter.default.post(name: NSNotification.Name("status"), object: nil)
            case .failure(let err):
                //handle err.
                print(err.localizedDescription)
            }
            
        }
    }
    
    func logout() {
        let userDefaults = UserDefaults.standard
        guard let token = userDefaults.string(forKey: "jwt") else {
            print("token is missing")
            //handle err)
            return
        }
        
        WebService().logout(token: token) { result in
            switch result {
            case .success(_):
                print("Succesfully logged out")
                userDefaults.setValue(false, forKey: "status")
                NotificationCenter.default.post(name: NSNotification.Name("status"), object: nil)
            case .failure(let err):
                print (err.localizedDescription)
                //handle err
            }
        } 
    }
}
