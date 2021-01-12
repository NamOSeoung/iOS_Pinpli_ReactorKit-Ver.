//
//  PlaceListRt.swift
//  Pinpli
//
//  Created by 남오승 on 2020/12/27.
//

import ReactorKit
import RxSwift

//장소목록 ReactorKit 적용(Reactor)
final class PlaceListRT: Reactor {
    // Action is an user interaction

    fileprivate let placeListService: PlaceListService
    
    enum Action {
        case placeList([String:Any]?)
    }
    
    // Mutate is a state manipulator which is not exposed to a view
    enum Mutation {
        case setPlaceList([PlaceListModel]?)
//        case setIndicator(Bool?)
        case setErrors(Bool?)
//        case setTimeOut(Bool?)
    }
    
    // State is a current view state(상태관리)
    struct State {
        var isPlaceList:[PlaceListModel]?
//        var isIndecator : Bool?
        var isErrors: Bool?
//        var isTimeOut: Bool?
    }
    
    let initialState: State
    
    init() {
        self.initialState = State()
        placeListService = PlaceListService()
    }
    
    // Action -> Mutation
    func mutate(action: Action) -> Observable<Mutation> {
        switch action {
        case let .placeList(params):
            return Observable.concat([
                getPlaceList(params: params).map{ result in
                    if result.code == 200 {
                        return Mutation.setPlaceList(result.dataList)
                    }else {
                        return Mutation.setErrors(true)
                    }
                },
                Observable.just(Mutation.setPlaceList(nil)),
                Observable.just(Mutation.setErrors(nil))
            ])
        }
    }
    
    // Mutation -> State
    func reduce(state: State, mutation: Mutation) -> State {
        var state = state
        
        switch mutation {
        case let .setPlaceList(list):
            state.isPlaceList = list
        case let .setErrors(flag):
            state.isErrors = flag
        }
        
        return state
    }
    
    //장소조회
    func getPlaceList(params:[String:Any]?) -> Observable<PlaceListRPModel> {
        return placeListService.getPlaceList(params: params!)
    }
}
