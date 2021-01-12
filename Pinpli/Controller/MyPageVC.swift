//
//  MyInfoVC.swift
//  Pinpli
//
//  Created by 남오승 on 2020/12/25.
//

import UIKit
import SnapKit

//내정보
class MyPageVC:BaseViewController {
    
    let myPageLogoutView = MyPageLogoutView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = myPageLogoutView

//        view = searchView
    }
}
