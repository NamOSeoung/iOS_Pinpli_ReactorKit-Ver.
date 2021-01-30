//
//  SearchKeywordVC.swift
//  Pinpli
//
//  Created by 남오승 on 2021/01/26.
//

import UIKit
import SnapKit
import RxCocoa
import RxSwift

//키워드 검색화면
class SearchKeywordVC:BaseViewController {

    let searchKeywordView = SearchKeywordView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = searchKeywordView
        
        /* UIEvent */
        let isBackEvent = searchKeywordView.backEvent.filter{$0}
        
        isBackEvent.bind{[weak self] result in
            self?.dismiss(animated: true, completion: nil)
        }.disposed(by: disposeBag)
        /* */
    }
}
