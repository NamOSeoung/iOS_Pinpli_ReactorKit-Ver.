//
//  KakaoAPIRequestService.swift
//  Pinpli
//
//  Created by 남오승 on 2021/03/07.
//

import Alamofire
import RxSwift
import RxAlamofire

protocol KakaoAPIRequestService {
    associatedtype NetworkData: Codable
    func getable(URL:String, body:[String:Any]?)-> Observable<NetworkData>
    func postable(URL:String, body:[String:Any]?)-> Observable<NetworkData>
    func deletaable(URL:String, body:[String:Any]?)-> Observable<NetworkData>
    func putable(URL:String, body:[String:Any]?)-> Observable<NetworkData>
}

//모든 API호출 시 공통으로 사용 가능하도록 Alamofire 세팅한 서비스
extension KakaoAPIRequestService {
    
    func getable(URL:String, body:[String:Any]? )-> Observable<NetworkData> {
        let headers = KakaoHeaderCommon.shareInstance.headerSetting()
        return RxAlamofire.requestData(.get, URL, parameters: body, encoding: URLEncoding.default, headers: headers, interceptor: .none)
            .mapObject(type: NetworkData.self)
    }
    
    func postable(URL:String, body:[String:Any]? )-> Observable<NetworkData> {
        let headers = KakaoHeaderCommon.shareInstance.headerSetting()
        return RxAlamofire.requestData(.post, URL, parameters: body, encoding: JSONEncoding.default, headers: headers, interceptor: .none)
            .mapObject(type: NetworkData.self)
    }
    
    func deletaable(URL:String, body:[String:Any]?)-> Observable<NetworkData> {
        let headers = KakaoHeaderCommon.shareInstance.headerSetting()
        return RxAlamofire.requestData(.delete, URL, parameters: body, encoding: JSONEncoding.default, headers: headers, interceptor: .none)
            .mapObject(type: NetworkData.self)
    }
    
    func putable(URL:String, body:[String:Any]?)-> Observable<NetworkData> {
        let headers = KakaoHeaderCommon.shareInstance.headerSetting()
        return RxAlamofire.requestData(.put, URL, parameters: body, encoding: JSONEncoding.default, headers: headers, interceptor: .none)
            .mapObject(type: NetworkData.self)
    }
}
