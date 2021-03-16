//
//  FAQRPModel.swift
//  Pinpli
//
//  Created by 남오승 on 2021/03/14.
//

import Foundation

//FAQ 전용 ResponseModel
struct FAQRPModel : Codable {
    
    let data : FAQRPModelData?
    
    enum CodingKeys: String, CodingKey {
        case data = "data"
    }
}

struct FAQRPModelData : Codable {
    
    let faqs : [Faq]?
    
    enum CodingKeys: String, CodingKey {
        case faqs = "faqs"
    }
}

struct Faq : Codable {
    
    let content : String?
    let createdAt : Int?
    let faqId : String?
    let subject : String?
    
    enum CodingKeys: String, CodingKey {
        case content = "content"
        case createdAt = "created_at"
        case faqId = "faq_id"
        case subject = "subject"
    }
    
}
