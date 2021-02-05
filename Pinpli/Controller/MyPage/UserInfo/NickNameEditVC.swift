//
//  NickNameEdit.swift
//  Pinpli
//
//  Created by 남오승 on 2021/02/05.
//

import UIKit
import SnapKit

//닉네임 변경 전용 VC
class NickNameEditVC:BaseViewController {

    let nickNameEditView = NickNameEditView()
    override func viewDidLoad() {
        super.viewDidLoad()
        view = nickNameEditView


        /* UIEvent */
        let isCloseEvent = nickNameEditView.closeEvent.filter{$0} //화면 닫기 이벤트
        isCloseEvent.bind{[weak self] result in
            self?.dismiss(animated: true, completion: nil)
        }.disposed(by: disposeBag)
        /* */

    }
}
