//
//  NoticeRPModel.swift
//  Pinpli
//
//  Created by 남오승 on 2021/03/17.
//

import Foundation

//공지사항 리스트 전용 Response Model
struct NoticeRPModel : Codable {
    let errors: ErrorRPModel?
    let data : NoticeRPModelData?
}

struct NoticeRPModelData : Codable {
    let notices : [Notice]?
}

struct Notice : Codable {
    let content : String?
    let createdAt : Int?
    let noticeId : String?
    let subject : String?
    
    enum CodingKeys: String, CodingKey {
        case content = "content"
        case createdAt = "created_at"
        case noticeId = "notice_id"
        case subject = "subject"
    }
}
