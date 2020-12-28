//
//  ModelToDictionary.swift
//  Pinpli
//
//  Created by 남오승 on 2020/12/27.
//

import Foundation

protocol ModelToDictionary {
    associatedtype NetworkData: Codable
    static func modelToDictionary(model:Codable) -> [String:Any]
}

//Model to Dictionary 공통
extension ModelToDictionary {
    //모델데이터 Distionary로 변환
    static func modelToDictionary(model:Codable) -> [String:Any] {
        return (try? model.asDictionary()) ?? [:]
    }
}
