//
//  LocationRPModel.swift
//  Pinpli
//
//  Created by 남오승 on 2020/12/28.
//

struct KakaoLocationRPModel : Codable {
    
    let documents : [KakaoDocuments]?
    let meta : KakaoMeta?
    
    enum CodingKeys: String, CodingKey {
        case documents = "documents"
        case meta = "meta"
    }
}

struct KakaoMeta : Codable {
    
    let totalCount : Int?
    
    enum CodingKeys: String, CodingKey {
        case totalCount = "total_count"
    }
}

struct KakaoDocuments : Codable {
    
    let address : KakaoAddress?
    let roadAddress : String?
    
    enum CodingKeys: String, CodingKey {
        case address = "address"
        case roadAddress = "road_address"
    }
}

struct KakaoAddress : Codable {
    
    let addressName : String?
    let mainAddressNo : String?
    let mountainYn : String?
    let region1depthName : String?
    let region2depthName : String?
    let region3depthName : String?
    let subAddressNo : String?
    let zipCode : String?
    
    enum CodingKeys: String, CodingKey {
        case addressName = "address_name"
        case mainAddressNo = "main_address_no"
        case mountainYn = "mountain_yn"
        case region1depthName = "region_1depth_name"
        case region2depthName = "region_2depth_name"
        case region3depthName = "region_3depth_name"
        case subAddressNo = "sub_address_no"
        case zipCode = "zip_code"
    }
}
