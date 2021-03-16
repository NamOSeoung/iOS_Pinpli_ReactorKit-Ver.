//
//  QuestionWriteVC.swift
//  Pinpli
//
//  Created by 남오승 on 2021/02/04.
//

import UIKit
import SnapKit

//관리자에게 문의하기 전용 뷰
class QuestionWriteViewUI: BaseView {
    
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
        label.text = "문의할 내용을 적어주세요\n빠르게 답변 드릴게요 😊"
        label.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 30)
        label.colorSetting(r: 0, g: 0, b: 0, alpha: 1)
        label.numberOfLines = 2
        label.textAlignment = .left
        label.setLinespace(spacing: 8)
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
    lazy var contentsWrap:UIView = {
        let view = UIView()
        view.layer.borderWidth = 0.5
        view.layer.borderColor = UIColor(red: 189/255, green: 189/255, blue: 189/255, alpha: 1).cgColor
        return view
    }()
    lazy var contentsGL:UILabel = {
        let label = UILabel()
        label.text = "핀플리에게 문의하고 싶은 내용을 적어주세요!\n최대한 빠른 시일 내에 답변 드리겠습니다 :)"
        label.numberOfLines = 2
        label.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 14)
        label.colorSetting(r: 189, g: 189, b: 189, alpha: 1)
        label.setLinespace(spacing: 5)
        label.isHidden = false
        return label
    }()
    lazy var contentsTV:UITextView = {
        let textView = UITextView()
        textView.setBackgroundColor(r: 255, g: 255, b: 255, alpha: 1)
        textView.text = ""
        textView.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 14)
        textView.colorSetting(r: 0, g: 0, b: 0, alpha: 1)
        textView.textAlignment = .left
        textView.textContainerInset = UIEdgeInsets(top: 0,left: 0,bottom: 0,right: 0)
        textView.isHidden = true
        return textView
    }()
    lazy var writeCompleteWrap:UIView = {
        let view = UIView()
        view.setBackgroundColor(r: 242, g: 242, b: 242, alpha: 1)
        return view
    }()
    lazy var writeCompleteGL:UILabel = {
        let label = UILabel()
        label.text = "문의 작성 완료"
        label.font = UIFont(name: "AppleSDGothicNeo-SemiBold", size: 16)
        label.colorSetting(r: 0, g: 0, b: 0, alpha: 1)
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
        addSubview(contentsCntGL)
        addSubview(contentsWrap)
        contentsWrap.addSubview(contentsGL)
        contentsWrap.addSubview(contentsTV)
        addSubview(writeCompleteWrap)
        writeCompleteWrap.addSubview(writeCompleteGL)
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
            let fontSize = aspectRatio(standardSize: 30)
            questionTitleGL.font = questionTitleGL.font.withSize(fontSize)
            make.leading.equalTo(24)
            make.top.equalTo(closeWrap.snp.bottom)
        }
        contentsCntGL.snp.makeConstraints { (make) in
            let fontSize = aspectRatio(standardSize: 14)
            let topRatio = constraintRatio(direction: .top, standardSize: 12)
            make.trailing.equalTo(-24)
            make.top.equalTo(questionTitleGL.snp.bottom).offset(topRatio)
            contentsCntGL.font = contentsCntGL.font.withSize(fontSize)
        }
        contentsWrap.snp.makeConstraints { (make) in
            let height = aspectRatio(standardSize: 200)
            let topRatio = constraintRatio(direction: .top, standardSize: 10)
            make.leading.equalTo(23)
            make.trailing.equalTo(-23)
            make.height.equalTo(height)
            make.top.equalTo(contentsCntGL.snp.bottom).offset(topRatio)
        }
        contentsGL.snp.makeConstraints { (make) in
            let fontSize = aspectRatio(standardSize: 14)
            contentsGL.font = contentsGL.font.withSize(fontSize)
            make.leading.top.equalTo(22)
            make.trailing.equalTo(-22)
        }
        contentsTV.snp.makeConstraints { (make) in
            let fontSize = aspectRatio(standardSize: 14)
            contentsTV.font = contentsTV.font?.withSize(fontSize)
            make.leading.top.equalTo(22)
            make.trailing.bottom.equalTo(-22)
        }
    }
    
    func completeWrapColorSetting(writeFlag:Bool) {
        if writeFlag {
            writeCompleteWrap.setBackgroundColor(r: 0, g: 0, b: 0, alpha: 1)
            writeCompleteGL.colorSetting(r: 255, g: 255, b: 255, alpha: 1)
        }else {
            writeCompleteWrap.setBackgroundColor(r: 242, g: 242, b: 242, alpha: 1)
            writeCompleteGL.colorSetting(r: 0, g: 0, b: 0, alpha: 1)
        }
    }
    
    func completeWrapSetting(keyboardHeight:CGFloat) {
        writeCompleteWrap.snp.makeConstraints { (make) in
            let height = aspectRatio(standardSize: 44)
            make.height.equalTo(height)
            make.leading.trailing.equalTo(safeAreaLayoutGuide)
            make.bottom.equalTo(-(keyboardHeight))
        }
        writeCompleteGL.snp.makeConstraints { (make) in
            let fontSize = aspectRatio(standardSize: 16)
            writeCompleteGL.font = writeCompleteGL.font.withSize(fontSize)
            make.leading.top.trailing.bottom.equalToSuperview()
        }
    }
}
