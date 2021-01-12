//
//  AroundStoreRT.swift
//  Pinpli
//
//  Created by 남오승 on 2020/12/29.
//

import ReactorKit
import RxSwift

//내 주변 가게 ReactorKit 적용(Reactor)
final class AroundStoreRT: Reactor {

    //카카오 좌표로 주소 찾기 API서비스
    fileprivate let kakaoLocationAPIService: KakaoLocationAPIService
    fileprivate let aroundStoreService: AroundStoreService
    
    enum Action {
        case kakaoLocation([String:Any]?) //카카오 API를 통한 현재 위치 정보 호출
        case aroundStore([String:Any]?)
    }
    
    // Mutate is a state manipulator which is not exposed to a view
    enum Mutation {
        case setKakaoLocation(KakaoLocationRPModel?)
        case setAroundStoreList(AroundStoreRPModel?)
//        case setIndicator(Bool?)
        case setErrors(Bool?)
//        case setTimeOut(Bool?)
    }
    
    // State is a current view state(상태관리)
    struct State {
        var isKakaoLocation: KakaoLocationRPModel?
        var isAroundStoreList: AroundStoreRPModel?
//        var isIndecator : Bool?
        var isErrors: Bool?
//        var isTimeOut: Bool?
    }
    
    let initialState: State
    
    init() {
        self.initialState = State()
        kakaoLocationAPIService = KakaoLocationAPIService()
        aroundStoreService = AroundStoreService()
    }
    
    // Action -> Mutation
    func mutate(action: Action) -> Observable<Mutation> {
        switch action {
        case let .kakaoLocation(params):
            return Observable.concat([
                getKakaoLocation(params: params)
                    .map{Mutation.setKakaoLocation($0)},
                Observable.just(Mutation.setKakaoLocation(nil))
            ])
        case let .aroundStore(params):
            return Observable.concat([
                getAroundStoreList(params: params)
                    .map{Mutation.setAroundStoreList($0)},
                Observable.just(Mutation.setAroundStoreList(nil))
            ])
        }
    }
    
    // Mutation -> State
    func reduce(state: State, mutation: Mutation) -> State {
        var state = state
        
        switch mutation {
        case let .setErrors(flag):
            state.isErrors = flag
        case let .setKakaoLocation(data):
            state.isKakaoLocation = data
        case let .setAroundStoreList(data):
            state.isAroundStoreList = data
        }
        
        return state
    }

    //카카오 현재 위치 조회
    func getKakaoLocation(params:[String:Any]?) -> Observable<KakaoLocationRPModel> {
        return kakaoLocationAPIService.getKakaoLocation(params: params)
    }
    
    //내 주변 상점 조회
    func getAroundStoreList(params:[String:Any]?) -> Observable<AroundStoreRPModel> {
        return aroundStoreService.getAroundStoreList(params: params)
    }
}
