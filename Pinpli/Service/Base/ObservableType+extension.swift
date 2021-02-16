//
//  APIJSONDecoding.swift
//  Pinpli
//
//  Created by 남오승 on 2020/12/27.
//

import RxSwift

extension ObservableType {
    
    public func mapObject<T: Codable>(type: T.Type) -> Observable<T> {
        return flatMap { data -> Observable<T> in
            let responseTuple = data as? (HTTPURLResponse, Data)
            
            guard let jsonData = responseTuple?.1 else {
                throw NSError(
                    domain: "",
                    code: -1,
                    userInfo: [NSLocalizedDescriptionKey: "JSON모델 디코딩 에러"]
                )
            }
            
            let json = try? JSONSerialization.jsonObject(with: jsonData, options: [])
            //json데이터print해서 볼 수 있도록 조치.
            print("returnData:\(json)")
            
            let decoder = JSONDecoder()
            let object = try decoder.decode(T.self, from: jsonData)
        
            return Observable.just(object)
        }
    }
}
