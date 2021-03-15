//
//  NickNameEditViewModel.swift
//  Pinpli
//
//  Created by 남오승 on 2021/03/03.
//

import RxSwift
import RxCocoa

//닉네임 변경 전용 ViewModel
class NickNameEditViewModel {
    
    private let disposeBag = DisposeBag()
    
    //service
    var nickNameEditService = NickNameEditService()
    
    //input
    var nickNameEditInput:BehaviorRelay<[String:String]?> = BehaviorRelay.init(value: nil)

    //output
    var nickNameEditSuccessOutput:BehaviorRelay<Bool?> = BehaviorRelay.init(value: nil)
    var tokenValidationCheckFlag:BehaviorRelay<Bool?> = BehaviorRelay.init(value: nil)
    
    init(nickNameEditService: NickNameEditService) {
        self.nickNameEditService = nickNameEditService
        
        nickNameEditInput
            .filter{$0 != nil }
            .subscribe(onNext:{ [weak self] result in
            self?.putNickNameEdit(params: result!)
        }).disposed(by: disposeBag)
        
    }
    
    private func putNickNameEdit(params:[String:String]) {
        nickNameEditService.putNickNameEdit(params: params)
            .subscribe(onNext:{ [weak self] result in
                if result.data != nil { //성공
                    self?.nickNameEditSuccessOutput.accept(true)
                }else {
                    self?.nickNameEditSuccessOutput.accept(false)
                }
            }).disposed(by: disposeBag)
    }
}
