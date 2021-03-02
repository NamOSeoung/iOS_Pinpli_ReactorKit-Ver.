//
//  SuccessRPModel.swift
//  Pinpli
//
//  Created by 남오승 on 2021/03/02.
//

import Foundation

struct SuccessRPModel: Codable {
    let errors: ErrorRPModel?
    let data: ResultData?
}

struct ResultData: Codable {
    let result: String
}
