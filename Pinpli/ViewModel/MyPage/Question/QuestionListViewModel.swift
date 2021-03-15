//
//  QuestionListViewModel.swift
//  Pinpli
//
//  Created by 남오승 on 2021/03/15.
//

import Foundation
import RxSwift
import RxCocoa

//1:1 문의 리스트 관련 ViewModel
final class QuestionListViewModel {
    
    private let disposeBag = DisposeBag()
    
    //service
    var questionListService: QuestionListService
    var questionDeleteService: QuestionDeleteService

    //input
    var questionListCallInput:BehaviorRelay<Bool?> = BehaviorRelay.init(value: nil)
    var questionDeleteCallInput:BehaviorRelay<String?> = BehaviorRelay.init(value: nil)
    
    //output
    var questionListOutput: BehaviorRelay<[QuestionModel]?> = BehaviorRelay.init(value: nil)

    init( questionListService : QuestionListService,
          questionDeleteService : QuestionDeleteService) {
        
        self.questionListService = questionListService
        self.questionDeleteService = questionDeleteService
        
        questionDeleteCallInput
            .filter{$0 != nil}
            .bind{[weak self] result in
                self?.deleteQuestion(questionId: result!)
            }.disposed(by: disposeBag)
        
        questionListCallInput
            .filter{$0 != nil}
            .bind{[weak self] result in
            if result! {
                self?.getQuestionList()
            }
        }.disposed(by: disposeBag)
        
    }
    
    private func getQuestionList() {
        questionListService.getQuestionList()
            .subscribe(onNext:{[weak self] result in
                if result.data != nil { //성공
                    self?.questionListOutput.accept(result.data?.questions)
                }else { //실패
                    
                }
            }).disposed(by: disposeBag)
    }
    
    private func deleteQuestion(questionId:String) {
        questionDeleteService.deleteQuestion(questionId: questionId)
            .subscribe(onNext:{[weak self] result in
                if result.data != nil { //성공
                    self?.getQuestionList()
                }else { //실패
                    
                }
            }).disposed(by: disposeBag)
    }
}
