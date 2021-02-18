//
//  StoreDetailVC.swift
//  Pinpli
//
//  Created by 남오승 on 2021/01/05.
//

import UIKit
import SnapKit

//가게 상세정보
class StoreDetailVC:BaseViewController {
    
    let storeDetailView = StoreDetailView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = storeDetailView
        
        /* UIEvent */
        let isBackEvent = storeDetailView.backEvent.filter{$0}
        let isReviewWrite = storeDetailView.reviewWriteEvent.filter{$0}
        let isCallEvent = storeDetailView.callEvent.filter{$0}
        let isShareEvent = storeDetailView.shareEvent.filter{$0}
        let isCopyAddress = storeDetailView.copyAddressEvent.filter{$0}
        
        isBackEvent.bind{[weak self] result in
            self?.navigationController?.popViewController(animated: true)
        }.disposed(by: disposeBag)
        
        isReviewWrite.bind{[weak self] result in
            let reviewWriteVC = ReviewWriteVC()
            reviewWriteVC.modalPresentationStyle = .fullScreen
            self?.present(reviewWriteVC, animated: true, completion: nil)
        }.disposed(by: disposeBag)
        
        isCallEvent.bind{[weak self] result in
            self?.storePhoneCall()
        }.disposed(by: disposeBag)
        
        isShareEvent.bind{[weak self] result in
            self?.storeShare()
        }.disposed(by: disposeBag)
        
        isCopyAddress.bind{[weak self] result in
            self?.storeCopyAddress()
        }.disposed(by: disposeBag)
        /* */
    }
    
    //상점에 전화하기 function
    func storePhoneCall() {
        
        let alert = UIAlertController(title: "010 - 4919 - 1128", message: "", preferredStyle: .alert)
                          
        alert.setValue(NSAttributedString(string: alert.title!, attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.semibold), NSAttributedString.Key.foregroundColor : UIColor.black]), forKey: "attributedTitle")
                          
        alert.setValue(NSAttributedString(string: alert.message!, attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 13,weight: UIFont.Weight.regular),NSAttributedString.Key.foregroundColor :UIColor.black]), forKey: "attributedMessage")
                       
        let subview = (alert.view.subviews.first?.subviews.first?.subviews.first!)! as UIView

        alert.addAction(UIAlertAction(title: "취소", style: .cancel, handler: {(action:UIAlertAction!) in }))
        
        alert.addAction(UIAlertAction(title: "전화 걸기", style: .default, handler: {(action:UIAlertAction!) in
            
            if let phoneCallURL = URL(string: "tel://01049191128") {
             let application:UIApplication = UIApplication.shared
                 if (application.canOpenURL(phoneCallURL)) {
                     application.open(phoneCallURL, options: [:], completionHandler: nil)
                 }
               return
             }
        }))
            
        subview.backgroundColor = UIColor.white
        present(alert, animated: true)
    }
    
    //상점 주소 복사
    func storeCopyAddress() {
        UIPasteboard.general.string = "으ㅜ아"
        if let storeCopyAddress = UIPasteboard.general.string {
            print("dasdasd" + storeCopyAddress)
        }
    }
    
    //상점 공유하기
    func storeShare() {
        let shareText: String = "share text test!"
        var shareObject = [Any]()
        shareObject.append(shareText)
        let activityViewController = UIActivityViewController(activityItems : shareObject, applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = self.view
        //activityViewController.excludedActivityTypes = [UIActivity.ActivityType.airDrop, UIActivity.ActivityType.postToFacebook,UIActivity.ActivityType.postToTwitter,UIActivity.ActivityType.mail]
        present(activityViewController, animated: true, completion: nil)
    }
}
