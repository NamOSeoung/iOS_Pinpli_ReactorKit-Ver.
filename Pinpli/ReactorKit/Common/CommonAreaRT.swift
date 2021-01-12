//
//  CommonAreaRT.swift
//  Pinpli
//
//  Created by 남오승 on 2020/12/27.
//

import ReactorKit
import RxSwift

//지역조회 ReactorKit 적용(Reactor)
final class CommonAreaRT: Reactor {
    // Action is an user interaction

    fileprivate let commonAreaService: CommonAreaService
    fileprivate let commonAreaSearchService: CommonAreaSearchService
    fileprivate let kakaoLocationAPIService: KakaoLocationAPIService
    
    enum Action {
        case firstArea
        case secondArea([String:Any]?)
        case areaSearch
        case kakaoLocation([String:Any]?) //카카오 API를 통한 현재 위치 정보 호출
    }
    
    // Mutate is a state manipulator which is not exposed to a view
    enum Mutation {
        case setFirstArea([CommonAreaModel]?)
        case setSecondArea([CommonAreaModel]?)
        case setAreaSearch([String]?)
        case setKakaoLocation(KakaoLocationRPModel?)
//        case setIndicator(Bool?)
        case setErrors(Bool?)
//        case setTimeOut(Bool?)
    }
    
    // State is a current view state(상태관리)
    struct State {
        var isFirstArea:[CommonAreaModel]?
        var isSecondArea:[CommonAreaModel]?
        var isAreaSearch:[String]?
        var isKakaoLocation: KakaoLocationRPModel?
//        var isIndecator : Bool?
        var isErrors: Bool?
//        var isTimeOut: Bool?
    }
    
    let initialState: State
    
    init() {
        self.initialState = State()
        commonAreaService = CommonAreaService()
        commonAreaSearchService = CommonAreaSearchService()
        kakaoLocationAPIService = KakaoLocationAPIService()
    }
    
    // Action -> Mutation
    func mutate(action: Action) -> Observable<Mutation> {
        switch action {
        case .areaSearch:
            return Observable.concat([
                getAreaSearch().map{ result in
                    if result.code == 200 {
                        return Mutation.setAreaSearch(result.dataList)
                    }else {
                        return Mutation.setErrors(true)
                    }
                },
                Observable.just(Mutation.setAreaSearch(nil)),
                Observable.just(Mutation.setErrors(nil))
            ])
        case .firstArea:
            return Observable.concat([
                getAreaFirst().map{ result in
                    if result.code == 200 {
                        return Mutation.setFirstArea(result.dataList)
                    }else {
                        return Mutation.setErrors(true)
                    }
                },
                Observable.just(Mutation.setFirstArea(nil)),
                Observable.just(Mutation.setErrors(nil))
            ])
        case let .secondArea(params):
            return Observable.concat([
                getAreaSecond(params: params).map{ result in
                    if result.code == 200 {
                        return Mutation.setSecondArea(result.dataList)
                    }else {
                        return Mutation.setErrors(true)
                    }
                },
                Observable.just(Mutation.setSecondArea(nil)),
                Observable.just(Mutation.setErrors(nil))
            ])
        case let .kakaoLocation(params):
            return Observable.concat([
                getKakaoLocation(params: params)
                    .map{Mutation.setKakaoLocation($0)},
                Observable.just(Mutation.setKakaoLocation(nil))
            ])
        }
    }
    
    // Mutation -> State
    func reduce(state: State, mutation: Mutation) -> State {
        var state = state
        
        switch mutation {
        case let .setFirstArea(list):
            state.isFirstArea = list
        case let .setSecondArea(list):
            state.isSecondArea = list
        case let .setAreaSearch(list):
            state.isAreaSearch = list
        case let .setErrors(flag):
            state.isErrors = flag
        case let .setKakaoLocation(data):
            state.isKakaoLocation = data
        }
        
        return state
    }
    
    //지역조회 - 대분류
    func getAreaFirst() -> Observable<CommonAreaRPModel> {
        return commonAreaService.getAreaFirst()
    }
    
    //지역조회 - 중분류
    func getAreaSecond(params:[String:Any]?) -> Observable<CommonAreaRPModel> {
        return commonAreaService.getAreaSecond(body: params)
    }
    
    //지역 검색
    func getAreaSearch() -> Observable<CommonAreaSearchRPModel> {
        return commonAreaSearchService.getAreaSearch()
    }
    
    //카카오 현재 위치 조회
    func getKakaoLocation(params:[String:Any]?) -> Observable<KakaoLocationRPModel> {
        return kakaoLocationAPIService.getKakaoLocation(params: params)
    }
}
