//
//  SearchKeywordViewModel.swift
//  Pinpli
//
//  Created by 남오승 on 2021/02/25.
//

import Foundation
import RxSwift
import RxCocoa

final class SearchKeywordViewModel {
    
    let disposeBag = DisposeBag()
    
    struct KeywordDeleteInput {
        var keywordDeleteAction: Observable<Void>
    }
    
    struct HotKeywordInput {
        var hotKeywordAction: Observable<Void>
    }
    
    struct RecentlyKeywordInput {
        var recentlyKeywordAction: Observable<Void>
    }

    struct KeywordDeleteOutput {
        var keywordDelete: Driver<String>
    }
    
    struct HotKeywordOutput {
        var hotKeywordList: Driver<[String]>
    }
    
    struct RecentlyKeywordOutput {
        var recentlykeywordList: Driver<[String]>
    }
    
    func keywordDelete(input: KeywordDeleteInput) -> KeywordDeleteOutput {
        let countedValue = BehaviorRelay(value: "")
        input.keywordDeleteAction
            .subscribe(onNext:{ _ in
                countedValue.accept("")
            }).disposed(by: disposeBag)
        
        return KeywordDeleteOutput(keywordDelete: countedValue.asDriver(onErrorJustReturn: ""))
    }
    
    func hotKeyword(input: HotKeywordInput) -> HotKeywordOutput {
        let list = BehaviorRelay.init(value: [String]())
        input.hotKeywordAction
            .subscribe(onNext:{ _ in
                list.accept(["sdasdasd","222"])
            }).disposed(by: disposeBag)
        
        return HotKeywordOutput(hotKeywordList: list.asDriver())
    }
    
    func recentlyKeyword(input: RecentlyKeywordInput) -> RecentlyKeywordOutput {
        let list = BehaviorRelay.init(value: [String]())
        input.recentlyKeywordAction
            .subscribe(onNext:{ _ in
                list.accept(["ddd","222"])
            }).disposed(by: disposeBag)
        return RecentlyKeywordOutput(recentlykeywordList: list.asDriver())
    }
}
