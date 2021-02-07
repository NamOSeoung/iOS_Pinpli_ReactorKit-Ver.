//
//  MyInfoVC.swift
//  Pinpli
//
//  Created by 남오승 on 2021/02/05.
//

import UIKit
import SnapKit

//내 정보 전용 VC
class MyInfoVC:BaseViewController {

    let myInfoView = MyInfoView()
    override func viewDidLoad() {
        super.viewDidLoad()
        view = myInfoView


        /* UIEvent */
        let isBackEvent = myInfoView.backEvent.filter{$0} //화면 뒤로가기 이벤트
        isBackEvent.bind{[weak self] result in
            self?.navigationController?.popViewController(animated: true)
        }.disposed(by: disposeBag)
        /* */

    }
}
