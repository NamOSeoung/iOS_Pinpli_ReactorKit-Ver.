//
//  QuestionDetailRPModel.swift
//  Pinpli
//
//  Created by 남오승 on 2021/03/16.
//

import Foundation

//1:1 문의하기 전용 Response Model
struct QuestionDetailRPModel: Codable {
    let errors : ErrorRPModel?
    let data : QuestionDetailRPModelData?
}

struct QuestionDetailRPModelData : Codable {
    
    let questionMeta : QuestionMeta?
    let questions : [Question]?
    
    enum CodingKeys: String, CodingKey {
        case questionMeta = "question_meta"
        case questions = "questions"
    }
}

struct Question : Codable {
    
    let content : String?
    let createdAt : Int?
    
    enum CodingKeys: String, CodingKey {
        case content = "content"
        case createdAt = "created_at"
    }
}

struct QuestionMeta : Codable {
    
    let createdAt : Int?
    let questionId : String?
    let status : String?
    
    enum CodingKeys: String, CodingKey {
        case createdAt = "created_at"
        case questionId = "question_id"
        case status = "status"
    }
}
