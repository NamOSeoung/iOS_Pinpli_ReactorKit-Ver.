//
//  PinPlaceVC.swift
//  Pinpli
//
//  Created by 남오승 on 2020/12/25.
//

import UIKit
import SnapKit

//Pin한 장소
class PinPlaceVC:BaseViewController {

    let pinPlaceView = PinPlaceView()
    let logoutView = LogoutView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view = pinPlaceView
        
        //로그인이 되어있지 않을경우에만 호출 - 우선 주석 처리
        pinPlaceView.logoutViewSetting(logoutView: logoutView)
    }
}
