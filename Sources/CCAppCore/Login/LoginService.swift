//
//  LoginService.swift
//  
//
//  Created by Connor Cates on 3/1/22.
//

import Foundation

protocol LoginService {
    
    func login(with email: String, password: String)
    
    func signUp(with email: String, password: String)
    
}
