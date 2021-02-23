//
//  ViewController.swift
//  Pinpli
//
//  Created by 남오승 on 2020/12/24.
//

import UIKit
import RxSwift
import RxCocoa
import RxGesture
import KakaoSDKAuth

class RootVC: BaseViewController {
    
    let rootViewUI = RootViewUI()
    var tourBtn:UIButton?
    var kakaoBtn:UIButton?
    var appleBtn:UIButton?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = rootViewUI
        bind()
    }
    
    private func bind() {
        tourBtn = rootViewUI.tourBtn
        kakaoBtn = rootViewUI.kakaoButton
        appleBtn = rootViewUI.appleButton
        
        /* Action */
        tourBtn?.rx.tap.asDriver()
            .drive(onNext:{ [weak self] result in
                self?.tourBtn?.showAnimation {
                    if let aroundStoreVC = self?.storyboard?.instantiateViewController(withIdentifier: "ServiceRootNavigation"){
                        self?.present(aroundStoreVC, animated: true, completion: nil)
                    }
                }
            }).disposed(by: disposeBag)
        
        kakaoBtn?.rx.tap.asDriver()
            .drive(onNext:{ [weak self] result in
                self?.kakaoLogin()
            }).disposed(by: disposeBag)
        
        appleBtn?.rx.tap.asDriver()
            .drive(onNext:{ [weak self] result in
                print("애플 로그인")
            }).disposed(by: disposeBag)
        
    }

    private func kakaoLogin() {

        // 카카오톡 설치 여부 확인
        if (AuthApi.isKakaoTalkLoginAvailable()) {
            //카카오톡 앱으로 로그인
            AuthApi.shared.loginWithKakaoTalk {(oauthToken, error) in
                if let error = error {
                    print(error)
                }
                else {
                    //do something
                    _ = oauthToken
                    let oauthProvider:String = "KAKAO"
                    if let oauthToken:String = oauthToken?.accessToken {
                        //                        result(SignInRQModel(oauth_provider: oauthProvider, oauth_token: oauthToken, user_id: nil, nickname: nil, birth: nil, gender: nil, address: nil))

                    }
                }
            }
        }else { //카카오톡 웹뷰 계정으로 로그인
            AuthApi.shared.loginWithKakaoAccount {(oauthToken, error) in
                if let error = error {
                    print(error)
                }
                else {
                    //do something
                    _ = oauthToken

                    let oauthProvider:String = "KAKAO"
                    if let oauthToken:String = oauthToken?.accessToken {
                        //                        result(SignInRQModel(oauth_provider: oauthProvider, oauth_token: oauthToken, user_id: nil, nickname: nil, birth: nil, gender: nil, address: nil))
                    }
                }
            }
        }
    }
}
