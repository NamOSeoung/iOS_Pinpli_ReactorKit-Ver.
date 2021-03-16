//
//  QuestionDetailViewUI.swift
//  Pinpli
//
//  Created by 남오승 on 2021/03/15.
//

import UIKit
import SnapKit

//1:1 문의하기 상세 전용 뷰
class QuestionDetailViewUI: BaseView {
    
    lazy var closeWrap:UIView = {
        let view = UIView()
        return view
    }()
    lazy var closeImage:UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "clear_24px")
        return image
    }()
    lazy var questionTitleGL:UILabel = {
        let label = UILabel()
        label.text = "2020.08.02에 문의한 내용"
        label.font = UIFont(name: "AppleSDGothicNeo-SemiBold", size: 18)
        label.colorSetting(r: 0, g: 0, b: 0, alpha: 1)
        label.numberOfLines = 1
        label.textAlignment = .left
        return label
    }()
    lazy var statusGL:UILabel = {
        let label = UILabel()
        label.text = "답변대기중"
        label.textAlignment = .right
        label.font = UIFont(name: "AppleSDGothicNeo-SemiBold", size: 16)
        label.colorSetting(r: 235, g: 87, b: 87, alpha: 1)
        return label
    }()
    lazy var contentsCntGL:UILabel = {
        let label = UILabel()
        label.text = "0 / 1000"
        label.colorSetting(r: 189, g: 189, b: 189, alpha: 1)
        label.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 14)
        label.textAlignment = .right
        return label
    }()
    
    lazy var scrollView:UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .white
        return scrollView
    }()
    lazy var scrollViewInnerWrap:UIView = {
        let view = UIView()
        return view
    }()
    
    lazy var questionContentsGL:UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 14)
        label.colorSetting(r: 0, g: 0, b: 0, alpha: 1)
        label.textAlignment = .left
        label.backgroundColor = .white
        label.text = ""
        return label
    }()
    
    lazy var gubunLine:UIView = {
        let view = UIView()
        view.setBackgroundColor(r: 222, g: 222, b: 222, alpha: 1)
        return view
    }()
    
    lazy var answerTitleGL:UILabel = {
        let label = UILabel()
        label.text = "🙋‍♀️문의하신 글에 대해서 대답한 내용이에요"
        label.font = UIFont(name: "AppleSDGothicNeo-SemiBold", size: 16)
        label.colorSetting(r: 0, g: 0, b: 0, alpha: 1)
        label.textAlignment = .center
        label.isHidden = true
        return label
    }()
    
    lazy var answerContentsGL:UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 14)
        label.colorSetting(r: 0, g: 0, b: 0, alpha: 1)
        label.textAlignment = .left
        label.backgroundColor = .white
        label.isHidden = true
        label.text = ""
        return label
    }()
    
    lazy var answerIsEmptyGL:UILabel = {
        let label = UILabel()
        let lineSpace = aspectRatio(standardSize: 5)
        label.numberOfLines = 2
        label.text = "답변을 하기 위해서 열심히 조사중이에요\n조금만 기다려주세요 🤔"
        label.colorSetting(r: 204, g: 204, b: 204, alpha: 1)
        label.font = UIFont(name: "AppleSDGothicNeo-SemiBold", size: 16)
        label.setLinespace(spacing: lineSpace)
        label.textAlignment = .center
        return label
    }()

    lazy var deleteWrap:UIView = {
        let view = UIView()
        view.setBackgroundColor(r: 0, g: 0, b: 0, alpha: 1)
        return view
    }()
    
    lazy var deleteGL:UILabel = {
        let label = UILabel()
        label.text = "삭제하기"
        label.colorSetting(r: 255, g: 255, b: 255, alpha: 1)
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
        addSubview(closeWrap)
        closeWrap.addSubview(closeImage)
        addSubview(questionTitleGL)
        addSubview(statusGL)
        addSubview(scrollView)
        scrollView.addSubview(scrollViewInnerWrap)
        scrollViewInnerWrap.addSubview(questionContentsGL)
        scrollViewInnerWrap.addSubview(gubunLine)
        scrollViewInnerWrap.addSubview(answerTitleGL)
        scrollViewInnerWrap.addSubview(answerIsEmptyGL)
        scrollViewInnerWrap.addSubview(answerContentsGL)
        addSubview(deleteWrap)
        deleteWrap.addSubview(deleteGL)
    }
    
    private func autoLayout() {
        closeWrap.snp.makeConstraints { (make) in
            let width = aspectRatio(standardSize: 110)
            let height = aspectRatio(standardSize: 50)
            make.width.equalTo(width)
            make.height.equalTo(height)
            make.top.leading.equalTo(safeAreaLayoutGuide)
        }
        closeImage.snp.makeConstraints { (make) in
            let width = aspectRatio(standardSize: 24)
            let leftRatio = constraintRatio(direction: .left, standardSize: 22)
            make.width.height.equalTo(width)
            make.leading.equalTo(leftRatio)
            make.centerY.equalToSuperview()
        }
        questionTitleGL.snp.makeConstraints { (make) in
            let fontSize = aspectRatio(standardSize: 18)
            let leftRatio = constraintRatio(direction: .left, standardSize: 29)
            questionTitleGL.font = questionTitleGL.font.withSize(fontSize)
            make.centerY.equalTo(closeWrap)
            make.leading.equalTo(closeImage.snp.trailing).offset(leftRatio)
        }
        statusGL.snp.makeConstraints { (make) in
            let fontSize = aspectRatio(standardSize: 16)
            statusGL.font = statusGL.font.withSize(fontSize)
            make.trailing.equalTo(-22)
//            make.leading.equalTo(questionTitleGL.snp.trailing).offset(20)
            make.centerY.equalTo(closeWrap)
        }
        scrollView.snp.makeConstraints { (make) in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(closeWrap.snp.bottom)
            make.bottom.equalTo(deleteWrap.snp.top)
        }
        scrollViewInnerWrap.snp.makeConstraints { (make) in
            make.width.equalToSuperview()
            make.centerX.top.bottom.equalToSuperview()
        }
        questionContentsGL.snp.makeConstraints { (make) in
            let fontSize = aspectRatio(standardSize: 14)
            let topRatio = constraintRatio(direction: .top, standardSize: 10)
            make.top.equalToSuperview().offset(topRatio)
            make.leading.equalTo(22)
            make.width.equalTo(currentViewSize.width - 44)
            make.centerX.equalToSuperview()
            questionContentsGL.font = questionContentsGL.font?.withSize(fontSize)
        }
        gubunLine.snp.makeConstraints { (make) in
            let topRatio = constraintRatio(direction: .top, standardSize: 40)
            make.height.equalTo(0.5)
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(questionContentsGL.snp.bottom).offset(topRatio)
        }
        answerTitleGL.snp.makeConstraints { (make) in
            let fontSize = aspectRatio(standardSize: 16)
            let topRatio = constraintRatio(direction: .top, standardSize: 30)
            answerTitleGL.font = answerTitleGL.font.withSize(fontSize)
            make.centerX.equalToSuperview()
            make.top.equalTo(gubunLine.snp.bottom).offset(topRatio)
        }
        answerIsEmptyGL.snp.makeConstraints { (make) in
            let fontSize = aspectRatio(standardSize: 16)
            let topRatio = constraintRatio(direction: .top, standardSize: 30)
            answerIsEmptyGL.font = answerIsEmptyGL.font.withSize(fontSize)
            make.centerX.equalToSuperview()
            make.top.equalTo(gubunLine.snp.bottom).offset(topRatio)
        }
        answerContentsGL.snp.makeConstraints { (make) in
            let fontSize = aspectRatio(standardSize: 14)
            let topRatio = constraintRatio(direction: .top, standardSize: 30)
            let bottomRatio = constraintRatio(direction: .bottom, standardSize: 30)
            make.leading.equalTo(22)
            make.top.equalTo(answerTitleGL.snp.bottom).offset(topRatio)
            make.width.equalTo(currentViewSize.width-44)
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().offset(-bottomRatio)
            answerContentsGL.font = answerContentsGL.font?.withSize(fontSize)
        }

        deleteWrap.snp.makeConstraints { (make) in
            let height = aspectRatio(standardSize: 83)
            make.leading.bottom.trailing.equalToSuperview()
            make.height.equalTo(height)
        }
        deleteGL.snp.makeConstraints { (make) in
            let fontSize = aspectRatio(standardSize: 16)
            let topRatio = constraintRatio(direction: .top, standardSize: 20)
            deleteGL.font = deleteGL.font.withSize(fontSize)
            make.top.equalTo(topRatio)
            make.centerX.equalToSuperview()
        }
    }
    
    //답변 여부 UI 컨트롤
    func answerIsEmptyCtrl(flag: Bool) {
        if flag { //답변 없음
            answerIsEmptyGL.isHidden = false
            answerTitleGL.isHidden = true
            answerContentsGL.isHidden = true
        }else { //답변 존재
            answerIsEmptyGL.isHidden = true
            answerTitleGL.isHidden = false
            answerContentsGL.isHidden = false
        }
    }
}
