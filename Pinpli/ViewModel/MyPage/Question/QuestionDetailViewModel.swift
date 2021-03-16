//
//  QuestionDetailViewModel.swift
//  Pinpli
//
//  Created by 남오승 on 2021/03/16.
//

import Foundation
import RxSwift
import RxCocoa

//1:1 문의 상세 관련 ViewModel
final class QuestionDetailViewModel {
    
    private let disposeBag = DisposeBag()
    
    //service
    var questionDetailService: QuestionDetailService
    var questionDeleteService: QuestionDeleteService
    
    //input
    var questionDetailCallInput:BehaviorRelay<String?> = BehaviorRelay.init(value: nil)
    var questionDeleteCallInput:BehaviorRelay<String?> = BehaviorRelay.init(value: nil)
    
    //output
    var questionDeleteOutput: BehaviorRelay<Bool?> = BehaviorRelay.init(value: nil)
    var questionMetaDetailOutput: BehaviorRelay<QuestionMeta?> = BehaviorRelay.init(value: nil)
    var questionDetailOutput: BehaviorRelay<[Question]?> = BehaviorRelay.init(value: nil)
    
    init( questionDetailService : QuestionDetailService,
          questionDeleteService : QuestionDeleteService) {
        
        self.questionDetailService = questionDetailService
        self.questionDeleteService = questionDeleteService
      
        questionDetailCallInput
            .filter{$0 != nil}
            .bind{[weak self] result in
                self?.getQuestionDetail(questionId: result!)
            }.disposed(by: disposeBag)
        
        questionDeleteCallInput
            .filter{$0 != nil}
            .bind{[weak self] result in
                self?.deleteQuestion(questionId: result!)
            }.disposed(by: disposeBag)
    }
    
    private func getQuestionDetail(questionId:String) {
        questionDetailService.getQuestionDetail(questionId: questionId)
            .subscribe(onNext:{[weak self] result in
                if result.data != nil { //성공
                    self?.questionMetaDetailOutput.accept(result.data?.questionMeta)
                    self?.questionDetailOutput.accept(result.data?.questions)
                }else { //실패
                    
                }
            }).disposed(by: disposeBag)
    }
    
    private func deleteQuestion(questionId:String) {
        questionDeleteService.deleteQuestion(questionId: questionId)
            .subscribe(onNext:{[weak self] result in
                if result.data != nil { //성공
                    self?.questionDeleteOutput.accept(true)
                }else { //실패
                    self?.questionDeleteOutput.accept(false)
                }
            }).disposed(by: disposeBag)
    }
}
