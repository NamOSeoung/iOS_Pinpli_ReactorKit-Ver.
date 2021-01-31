//
//  ReviewMoreListVC.swift
//  Pinpli
//
//  Created by 남오승 on 2021/01/21.
//

import UIKit

//리뷰 더보기 리스트
class ReviewMoreListVC: BaseViewController {
    let reviewMoreListView = ReviewMoreListView()
    var reviewGubun:Int = 0
    override func viewDidLoad() {
        view = reviewMoreListView
        
        reviewMoreListView.reviewTitleSetting(reviewGubun: reviewGubun)
        /* UIEvent */
        let isBackEvent = reviewMoreListView.backEvent.filter{$0}
        let isCellTouchEvent = reviewMoreListView.cellTouchEvent.filter{$0}
        isBackEvent.bind{[weak self] result in
            self?.navigationController?.popViewController(animated: true)
        }.disposed(by: disposeBag)
        isCellTouchEvent.bind{[weak self] result in
            let reviewDetailPinpliVC = ReviewDetailVC()
            reviewDetailPinpliVC.modalPresentationStyle = .fullScreen
            reviewDetailPinpliVC.reviewGubun = self?.reviewGubun ?? 0
            self?.present(reviewDetailPinpliVC, animated: true, completion: nil)
        }.disposed(by: disposeBag)
        /* */
    }
}
