//
//  QuestionDetailVC.swift
//  Pinpli
//
//  Created by 남오승 on 2021/03/15.
//

import UIKit
import SnapKit
import RxGesture
import RxKeyboard

//1:1문의내용 상세 전용 VC
class QuestionDetailVC:BaseViewController {
    
    let utcToLocalConverter = UTCToLocalConverter() //시간 변환기
    let questionDetailViewUI = QuestionDetailViewUI()
    let questionDetailViewModel = QuestionDetailViewModel(questionDetailService: QuestionDetailService(), questionDeleteService: QuestionDeleteService())

    var closeWrap:UIView? //화면 닫기 버튼
    var deleteWrap:UIView? //삭제하기 버튼
    var statueGL:UILabel? //답변 상태
    var questionTitleGL:UILabel? //문의 제목
    var questionContentsGL:UILabel? //문의 내용
    var answerContentsGL:UILabel? //답변 내용
    
    var preVC:Any? //이전화면 객체
    var questionId:String = String()
    override func viewDidLoad() {
        super.viewDidLoad()
        view = questionDetailViewUI
        
        bind()
    }
    
    private func bind() {
        /* UIInit */
        closeWrap = questionDetailViewUI.closeWrap
        deleteWrap = questionDetailViewUI.deleteWrap
        statueGL = questionDetailViewUI.statusGL
        questionTitleGL = questionDetailViewUI.questionTitleGL
        questionContentsGL = questionDetailViewUI.questionContentsGL
        answerContentsGL = questionDetailViewUI.answerContentsGL
        /* */

        /* UIEvent */
        closeWrap?.rx.tapGesture().when(.recognized)
            .bind{[weak self] result in
                self?.dismiss(animated: true, completion: nil)
            }.disposed(by: disposeBag)
        
        deleteWrap?.rx.tapGesture().when(.recognized)
            .bind{[weak self] result in
                self?.questionDeleteAlert()
            }.disposed(by: disposeBag)
        
        questionDetailViewUI.answerIsEmptyCtrl(flag: false)
        /* */
        
        /* Action */
        questionDetailViewModel.questionDetailCallInput.accept(questionId)
        /* */
        
        /* State */
        let questionDeleteOutput = questionDetailViewModel.questionDeleteOutput.filter{$0 != nil}
        let questionMetaDetailOutput = questionDetailViewModel.questionMetaDetailOutput.filter{$0 != nil}
        let questionDetailOutput = questionDetailViewModel.questionDetailOutput.filter{$0 != nil}

        questionDeleteOutput.bind{[weak self] result in
            if result! {
                if let myPageVC = self?.preVC as? MyPageVC {
                    myPageVC.questionListViewModel.questionListCallInput.accept(true) //삭제 성공 후 이전화면 문의 리스트 재 호출
                    self?.dismiss(animated: true, completion: nil)
                }
            }
        }.disposed(by: disposeBag)
        
        questionMetaDetailOutput.bind{[weak self] result in
            let title = ((self?.utcToLocalConverter.utcToLocalConvert(timeStamp: result?.createdAt ?? 0) ?? "") + "에 문의한 내용")
            self?.questionTitleGL?.text = title
            if result?.status == "ACCEPT" { //답변 대기중
                self?.statueGL?.text = "답변대기중"
                self?.statueGL?.colorSetting(r: 235, g: 87, b: 87, alpha: 1)
                self?.questionDetailViewUI.answerIsEmptyCtrl(flag: true)
            }else { //답변완료
                self?.statueGL?.text = "답변완료"
                self?.statueGL?.colorSetting(r: 114, g: 223, b: 171, alpha: 1)
                self?.questionDetailViewUI.answerIsEmptyCtrl(flag: false)
            }
        }.disposed(by: disposeBag)
        
        questionDetailOutput.bind{[weak self] result in
            
            if result?.count ?? 0 > 1 { //답변이 있다는것
                if let questionContents = result?[0].content {
                    self?.questionContentsGL?.text = questionContents
                }
                
                if let answerContents = result?[1].content {
                    self?.answerContentsGL?.text = answerContents
                }
            }else { //답변이 없다는 것
                if let questionContents = result?[0].content {
                    self?.questionContentsGL?.text = questionContents
                }
            }
            
        }.disposed(by: disposeBag)
        
    }
    
    //문의 삭제하기 Alert
    func questionDeleteAlert() {
        let alert = UIAlertController(title: "작성한 문의를 삭제할까요?", message: "\n삭제하게 된다면 소중하 문의를\n다시 찾아볼 수 없어요 :(", preferredStyle: .alert)
        
        // Change font and color of title
        
        alert.setValue(NSAttributedString(string: alert.title!, attributes: [NSAttributedString.Key.font : UIFont(name: "AppleSDGothicNeo-Bold", size: 17) ?? UIFont.systemFont(ofSize: 17,weight: UIFont.Weight.bold), NSAttributedString.Key.foregroundColor : UIColor.black]), forKey: "attributedTitle")
        
        alert.setValue(NSAttributedString(string: alert.message!, attributes: [NSAttributedString.Key.font : UIFont(name: "AppleSDGothicNeo-Regular", size: 13) ?? UIFont.systemFont(ofSize: 13,weight: UIFont.Weight.regular),NSAttributedString.Key.foregroundColor :UIColor.black]), forKey: "attributedMessage")
        
        let subview = (alert.view.subviews.first?.subviews.first?.subviews.first!)! as UIView
        
        alert.addAction(UIAlertAction(title: "취소하기", style: .cancel, handler: { (action:UIAlertAction!) in
            
        }))
        
        alert.addAction(UIAlertAction(title: "삭제하기", style: .default, handler: { [weak self] (action:UIAlertAction!) in
            self?.questionDetailViewModel.questionDeleteCallInput.accept(self?.questionId)
        }))
        
        subview.backgroundColor = UIColor.white
        
        present(alert, animated: true)
    }
}
