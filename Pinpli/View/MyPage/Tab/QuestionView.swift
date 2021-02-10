//
//  QuestionView.swift
//  Pinpli
//
//  Created by 남오승 on 2021/02/01.
//

import UIKit
import SnapKit
import RxCocoa

//1:1문의 탭
class QuestionView: BaseView {

    lazy var managerQuestionWrap:UIView = {
        let view = UIView()
        view.setBackgroundColor(r: 0, g: 0, b: 0, alpha: 1)
        return view
    }()
    lazy var managerQuestionGL:UILabel = {
        let label = UILabel()
        label.colorSetting(r: 255, g: 255, b: 255, alpha: 1)
        label.text = "관리자에게 문의하기"
        label.font = UIFont(name: "AppleSDGothicNeo-SemiBold", size: 16)
        label.textAlignment = .center
        return label
    }()
    lazy var questionWrap:UIView = {
        let view = UIView()
        return view
    }()
    lazy var questionIsEmptyGL01:UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 25)
        label.text = "🍟 😍 🍤"
        label.textAlignment = .center
        return label
    }()
    lazy var questionIsEmptyGL02:UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 16)
        label.text = "아직 작성한 문의가 없어요\n문의하고 싶은 내용이 있다면\n\"관리자에게 문의하기\" 를 눌러주세요"
        label.numberOfLines = 3
        label.setLinespace(spacing: 8)
        label.colorSetting(r: 0, g: 0, b: 0, alpha: 1)
        label.textAlignment = .center
        return label
    }()
    lazy var questionListTV:UITableView = {
        let table = UITableView()
        table.backgroundColor = .white
        table.keyboardDismissMode = .onDrag
        table.showsHorizontalScrollIndicator = false
        table.showsVerticalScrollIndicator = false
        table.separatorStyle = .none
        table.register(QuestionCell.self,
                       forCellReuseIdentifier: "QuestionCell")
        return table
    }()
    
    lazy var alertWrap:UIView = {
        let view = UIView()
        view.alpha = 0.0
        view.setBackgroundColor(r: 0, g: 0, b: 0, alpha: 0.8)
        return view
    }()
    lazy var alertGL:UILabel = {
        let label = UILabel()
        label.text = "문의 삭제를 완료하였습니다 😎"
        label.font = UIFont(name: "AppleSDGothicNeo-SemiBold", size: 16)
        label.textAlignment = .center
        return label
    }()
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        addContentView()
        autoLayout()
    }
    
    private func addContentView(){
        managerQuestionWrap.addSubview(managerQuestionGL)
    }
    
    private func autoLayout() {
        managerQuestionGL.snp.makeConstraints { (make) in
            let fontSize = aspectRatio(standardSize: 16)
            managerQuestionGL.font = managerQuestionGL.font.withSize(fontSize)
            make.leading.top.trailing.bottom.equalToSuperview()
        }
    }
    
    //질문 갯수에 따른 화면 처리
    func questionIsEmptyCtrl(questionCnt:Int) {
        for view in subviews {
            if view == questionWrap {
                view.removeFromSuperview()
            }
        }
        
        if questionCnt > 0 {
            questionWrap.addSubview(questionListTV)
            questionListTV.snp.makeConstraints { (make) in
                make.leading.top.trailing.bottom.equalToSuperview()
            }
        }else {
            questionWrap.addSubview(questionIsEmptyGL01)
            questionWrap.addSubview(questionIsEmptyGL02)
            questionIsEmptyGL01.snp.makeConstraints { (make) in
                let fontSize = aspectRatio(standardSize: 25)
                let topRatio = constraintRatio(direction: .top, standardSize: 97)
                questionIsEmptyGL01.font = questionIsEmptyGL01.font.withSize(fontSize)
                make.leading.trailing.equalToSuperview()
                make.top.equalTo(topRatio)
            }
            questionIsEmptyGL02.snp.makeConstraints { (make) in
                let fontSize = aspectRatio(standardSize: 16)
                let topRatio = constraintRatio(direction: .top, standardSize: 20)
                questionIsEmptyGL02.font = questionIsEmptyGL02.font.withSize(fontSize)
                make.leading.trailing.equalToSuperview()
                make.top.equalTo(questionIsEmptyGL01.snp.bottom).offset(topRatio)
            }
        }
    }
    
    func reviewDeletePop() {
        for view in questionWrap.subviews {
            if view == alertWrap {
                view.removeFromSuperview()
            }
        }
        questionWrap.addSubview(alertWrap)
        alertWrap.addSubview(alertGL)

        UIView.animate(withDuration: 0.5, animations: { [weak self] in
            self?.alertWrap.alpha = 1.0
        })
        
        alertWrap.snp.makeConstraints{ make in
            let height = aspectRatio(standardSize: 44)
            let bottomRatio = aspectRatio(standardSize: 30)
            make.height.equalTo(height)
            make.leading.equalTo(22)
            make.trailing.equalTo(-22)
            make.bottom.equalToSuperview().offset(-bottomRatio)
        }
        alertGL.snp.makeConstraints{ make in
            let fontSize = aspectRatio(standardSize: 16)
            alertGL.font = alertGL.font.withSize(fontSize)
            make.leading.top.trailing.bottom.equalToSuperview()
        }
        
        let timer = Timer.new(every: 2.0.second) {}
        timer.start(modes: .tracking)
        Timer.every(2.0.second) { [weak self] (timer: Timer) in
            timer.invalidate()

            UIView.animate(withDuration: 0.5, animations: { [weak self] in
                self?.alertWrap.alpha = 0.0
            })
        }
    }
}

