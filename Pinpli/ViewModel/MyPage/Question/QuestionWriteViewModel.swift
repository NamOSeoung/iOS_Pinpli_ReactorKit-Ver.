//
//  QuestionViewModel.swift
//  Pinpli
//
//  Created by 남오승 on 2021/03/15.
//

import Foundation
import RxSwift
import RxCocoa

//1:1 문의 작성 관련 ViewModel
final class QuestionWriteViewModel {
    
    private let disposeBag = DisposeBag()
    
    //service
    var questionWriteService: QuestionWriteService

    //input
    var contentsWriteInput:BehaviorRelay<[String:String]?> = BehaviorRelay.init(value: nil)
    
    //output
    var writeSuccessOutput:BehaviorRelay<Bool?> = BehaviorRelay.init(value: nil)
    

    init(
        questionWriteService : QuestionWriteService) {
        
        self.questionWriteService = questionWriteService
        
        contentsWriteInput.filter{$0 != nil}
            .bind{[weak self] result in
                self?.postQuestionWrite(params: result!)
            }.disposed(by: disposeBag)
    }
    
    private func postQuestionWrite(params:[String:String]) {
        questionWriteService.postQuestionWrite(params: params)
            .subscribe(onNext:{ [weak self] result in
                if result.data != nil { //성공
                    self?.writeSuccessOutput.accept(true)
                }else { //실패
                    self?.writeSuccessOutput.accept(false)
                }
            }).disposed(by: disposeBag)
    }
}
