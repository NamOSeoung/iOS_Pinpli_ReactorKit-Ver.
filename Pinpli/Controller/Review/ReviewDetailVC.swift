//
//  ReviewDetailPinpliVC.swift
//  Pinpli
//
//  Created by 남오승 on 2021/01/22.
//

import UIKit

//리뷰 상세
class ReviewDetailVC: BaseViewController {
    
    let reviewDetailPinpliView = ReviewDetailPinpliView()
    let reviewDetailSocialView = ReviewDetailSocialView()
    var reviewGubun:Int = 0
    
    override func viewDidLoad() {
        if reviewGubun == 3 {
            view = reviewDetailPinpliView
            /* UIEvent */
            let backEvent = reviewDetailPinpliView.backEvent.filter{$0}
            backEvent.bind{[weak self] result in
                self?.dismiss(animated: true, completion: nil)
            }.disposed(by: disposeBag)
        }else {
            view = reviewDetailSocialView
            reviewDetailSocialView.webViewSetting(url: "https://www.youtube.com/watch?v=1XwfYoQA7uo")
            /* UIEvent */
            let isBackEvent = reviewDetailSocialView.backEvent.filter{$0}
            let isLinkCopyEvent = reviewDetailSocialView.linkCopyEvent.filter{$0}
            let isShareEvent = reviewDetailSocialView.shareEvent.filter{$0}
            let isReviewPinEvent = reviewDetailSocialView.reviewPinEvent.filter{$0}
            let isBlackListEvent = reviewDetailSocialView.blackListEvent.filter{$0}
            isBackEvent.bind{[weak self] result in
                self?.dismiss(animated: true, completion: nil)
            }.disposed(by: disposeBag)
            
            isLinkCopyEvent.bind{[weak self] result in
                self?.linkCopyUrl()
            }.disposed(by: disposeBag)
            
            isShareEvent.bind{[weak self] result in
                self?.linkShare()
            }.disposed(by: disposeBag)
            
            isReviewPinEvent.bind{[weak self] result in
                self?.reviewPin(flag: true)
            }.disposed(by: disposeBag)
            
            isBlackListEvent.bind{[weak self] result in
                self?.blackListActionSheet()
            }.disposed(by: disposeBag)
            /* */
        }
    }
    
    //리뷰 주소 복사
    func linkCopyUrl() {
        UIPasteboard.general.string = "으ㅜ아"
        if let storeCopyAddress = UIPasteboard.general.string {
            print("dasdasd" + storeCopyAddress)
            reviewDetailSocialView.alertPopCtrl(popupGubun: 3, flag: true)
        }
        
    }
    
    //리뷰 공유하기
    func linkShare() {
        let shareText: String = "share text test!"
        var shareObject = [Any]()
        shareObject.append(shareText)
        let activityViewController = UIActivityViewController(activityItems : shareObject, applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = self.view
        //activityViewController.excludedActivityTypes = [UIActivity.ActivityType.airDrop, UIActivity.ActivityType.postToFacebook,UIActivity.ActivityType.postToTwitter,UIActivity.ActivityType.mail]
        present(activityViewController, animated: true, completion: nil)
    }
    
    
    //블랙리스트 추가/제거 액션시트
    func blackListActionSheet() {
        //action sheet 에 대한 설정 예시
        let sheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        sheet.addAction(UIAlertAction(title: "해당 작성자를 블랙리스트에 추가", style: .default, handler: { [weak self](action) in
            self?.reviewDetailSocialView.alertPopCtrl(popupGubun: 0,flag: true)
        }))
        sheet.addAction(UIAlertAction(title: "이 게시물만 블랙리스트에 추가", style: .default, handler: { [weak self] (action) in
            self?.reviewDetailSocialView.alertPopCtrl(popupGubun: 1,flag: true)
        }))
        sheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (action) in
                  //아무일도 일어나지 않음
        }))
              
        present(sheet, animated: true, completion: nil)
    }
    
    //리뷰 Pin 추가/제거
    func reviewPin(flag:Bool) {
        if flag { // 추가
            reviewDetailSocialView.alertPopCtrl(popupGubun: 2,flag: true)
        }else { // 제거
            reviewDetailSocialView.alertPopCtrl(popupGubun: 2,flag: false)
        }
    }
}
