//
//  NoticeFAQViewModel.swift
//  Pinpli
//
//  Created by 남오승 on 2021/03/15.
//

import Foundation
import RxSwift
import RxCocoa

//공지사항 전용 ViewModel
final class NoticeFAQViewModel {
    
    private let disposeBag = DisposeBag()
    
    //service
    var faqService: FAQService
    var noticeService : NoticeService

    //input
    var gubunInput:BehaviorRelay<Bool?> = BehaviorRelay.init(value: nil)
    
    //output
    var faqListOutput:BehaviorRelay<[Faq]?> = BehaviorRelay.init(value: nil)
    var noticeListOutput:BehaviorRelay<[Notice]?> = BehaviorRelay.init(value: nil)

    init(
        faqService : FAQService,
        noticeService : NoticeService) {
        
        self.faqService = faqService
        self.noticeService = noticeService
        
        gubunInput
            .filter{$0 != nil}
            .bind{ [weak self] result in
            if result! { //공지사항
                self?.getNotice()
            }else { //faq
                self?.getFAQ()
            }
        }.disposed(by: disposeBag)
    }
    
    //FAQ호출
    private func getFAQ() {
        faqService.getFAQ()
            .subscribe(onNext:{ [weak self] result in
                if result.data != nil { //성공
                    self?.faqListOutput.accept(result.data?.faqs)
                }else {
                    
                }
            }).disposed(by: disposeBag)
    }
    
    //공지사항 호출
    private func getNotice() {
        noticeService.getNotice()
            .subscribe(onNext:{ [weak self] result in
                if result.data != nil { //성공
                    self?.noticeListOutput.accept(result.data?.notices)
                }else { //실패
                    
                }
            }).disposed(by: disposeBag)
    }
}
