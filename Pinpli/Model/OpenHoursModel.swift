//
//  OpenHoursModel.swift
//  Pinpli
//
//  Created by 남오승 on 2020/12/28.
//

//영업시간용 Model
struct OpenHoursModel : Codable {
    
    let fri : Fri?
    let mon : Mon?
    let sat : Sat?
    let sun : Sun?
    let thu : Thu?
    let tue : Tue?
    let wed : Wed?
    
    enum CodingKeys: String, CodingKey {
        case fri = "Fri"
        case mon = "Mon"
        case sat = "Sat"
        case sun = "Sun"
        case thu = "Thu"
        case tue = "Tue"
        case wed = "Wed"
    }
    
    
}

struct Wed : Codable {
    
    let close : String?
    let closeNextday : String?
    let open : String?
    
    enum CodingKeys: String, CodingKey {
        case close = "close"
        case closeNextday = "close_nextday"
        case open = "open"
    }
    
}
struct Tue : Codable {
    
    let close : String?
    let closeNextday : String?
    let open : String?
    
    enum CodingKeys: String, CodingKey {
        case close = "close"
        case closeNextday = "close_nextday"
        case open = "open"
    }
    
}
struct Thu : Codable {
    
    let close : String?
    let closeNextday : String?
    let open : String?
    
    enum CodingKeys: String, CodingKey {
        case close = "close"
        case closeNextday = "close_nextday"
        case open = "open"
    }
    
}

struct Sun : Codable {
    
    let close : String?
    let closeNextday : String?
    let open : String?
    
    enum CodingKeys: String, CodingKey {
        case close = "close"
        case closeNextday = "close_nextday"
        case open = "open"
    }
    
}

struct Sat : Codable {
    
    let close : String?
    let closeNextday : String?
    let open : String?
    
    enum CodingKeys: String, CodingKey {
        case close = "close"
        case closeNextday = "close_nextday"
        case open = "open"
    }
}

struct Mon : Codable {
    
    let close : String?
    let closeNextday : String?
    let open : String?
    
    enum CodingKeys: String, CodingKey {
        case close = "close"
        case closeNextday = "close_nextday"
        case open = "open"
    }
    
}

struct Fri : Codable {
    
    let close : String?
    let closeNextday : String?
    let open : String?
    
    enum CodingKeys: String, CodingKey {
        case close = "close"
        case closeNextday = "close_nextday"
        case open = "open"
    }
}
