//
//  QuestionListRPModel.swift
//  Pinpli
//
//  Created by 남오승 on 2021/03/15.
//

import Foundation

//1:1문의 리스트 전용 Response Model
struct QuestionListRPModel : Codable {
    let errors: ErrorRPModel?
    let data : QuestionListRPModelData?
}

struct QuestionListRPModelData : Codable {
    let questions : [QuestionModel]?
}

struct QuestionModel : Codable {
    let content : String?
    let createdAt : Int?
    let questionId : String?
    let status : String?
    
    enum CodingKeys: String, CodingKey {
        case content = "content"
        case createdAt = "created_at"
        case questionId = "question_id"
        case status = "status"
    }
}
