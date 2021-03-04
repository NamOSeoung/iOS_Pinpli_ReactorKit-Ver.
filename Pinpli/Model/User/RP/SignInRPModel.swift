//
//  SignInRPModel.swift
//  Pinpli
//
//  Created by 남오승 on 2021/03/02.
//

import Foundation

struct SignInRPModel: Codable {
    let errors: ErrorRPModel?
    let data: TokenRPModel?
}

struct TokenRPModel: Codable {
    let token : String
}
