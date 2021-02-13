//
//  ViewController.swift
//  Pinpli
//
//  Created by 남오승 on 2020/12/24.
//

import UIKit
import KakaoSDKAuth
import KakaoSDKUser

class RootVC: BaseViewController {
    
    let rootView = RootView()
    override func viewDidLoad() {
        super.viewDidLoad()
        view = rootView
        
        let isTourEvent = rootView.tourEvent.filter{$0}
        let isKakaoEvent = rootView.kakaoEvent.filter{$0}
        let isAppleEvent = rootView.appleEvent.filter{$0}
        isTourEvent.bind{[weak self] result in
            if let aroundStoreVC = self?.storyboard?.instantiateViewController(withIdentifier: "ServiceRootNavigation"){
                self?.present(aroundStoreVC, animated: true, completion: nil)
            }
        }.disposed(by: disposeBag)
        
        isKakaoEvent.bind{[weak self] result in
            self?.kakaoLogin()
        }.disposed(by: disposeBag)
        
        isAppleEvent.bind{[weak self] result in
            print("애플 로그인")
        }.disposed(by: disposeBag)
        
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
