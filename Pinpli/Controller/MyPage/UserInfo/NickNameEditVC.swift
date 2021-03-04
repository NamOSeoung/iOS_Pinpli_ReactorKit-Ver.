//
//  NickNameEdit.swift
//  Pinpli
//
//  Created by 남오승 on 2021/02/05.
//

import UIKit
import RxSwift
import RxCocoa
import RxGesture

//닉네임 변경 전용 VC
class NickNameEditVC:BaseViewController {

    var closeWrap:UIView?
    var completeWrap:UIView?
    var nickNameEditTF:UITextField?
    var nickNameCntGL:UILabel?
    
    let nickNameEditViewUI = NickNameEditViewUI()
    var nickNameEditViewModel: NickNameEditViewModel = NickNameEditViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = nickNameEditViewUI
        bind()
    }
    
    private func bind() {
        /* UIInit */
        closeWrap = nickNameEditViewUI.closeWrap
        completeWrap = nickNameEditViewUI.completeWrap
        nickNameEditTF = nickNameEditViewUI.nickNameEditTF
        nickNameCntGL = nickNameEditViewUI.nickNameCntGL
        
        
        /* UIAction */
        closeWrap?.rx.tapGesture().when(.recognized) //닫기 버튼
            .bind{[weak self] _ in
                self?.dismiss(animated: true, completion: nil)
            }.disposed(by: disposeBag)
        
        completeWrap?.rx.tapGesture().when(.recognized) //변경하기 버튼
            .bind{[weak self] _ in
                if self?.nickNameEditTF?.text?.count ?? 0 > 0 {
                    print("변경하기")
                }
                
            }.disposed(by: disposeBag)
        
        nickNameEditTF?.rx.controlEvent(.editingChanged).subscribe(onNext: { [weak self] in
            if let text = self?.nickNameEditTF?.text {
                self?.nickNameEditTF?.text = String(text.prefix(10)) //닉네임 10자리 제한
                self?.nickNameCntGL?.text = "\(String(text.prefix(10)).count)/10"
                if text.count > 0 {
                    self?.nickNameEditViewUI.completeWrapColorSetting(writeFlag: true)
                }else {
                    self?.nickNameEditViewUI.completeWrapColorSetting(writeFlag: false)
                }
            }
        }).disposed(by: disposeBag)
        
    }
}
