//
//  ErrorRPModel.swift
//  Pinpli
//
//  Created by 남오승 on 2021/03/02.
//

import Foundation

struct ErrorRPModel: Codable {
    let errorCode: Int
    let message: String

    enum CodingKeys: String, CodingKey {
        case errorCode = "error_code"
        case message
    }
}
