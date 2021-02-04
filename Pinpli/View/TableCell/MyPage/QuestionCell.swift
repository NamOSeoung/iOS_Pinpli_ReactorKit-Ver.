//
//  QuestionCell.swift
//  Pinpli
//
//  Created by 남오승 on 2021/02/01.
//

import UIKit
//1:1문의 전용 Cell
class QuestionCell:BaseTableCell {
    
    lazy var writeDateGL:UILabel = {
        let label = UILabel()
        label.colorSetting(r: 189, g: 189, b: 189, alpha: 1)
        label.textAlignment = .left
        label.text = "2020.08.02"
        label.font = UIFont(name: "AppleSDGothicNeo-SemiBold", size: 16)
        return label
    }()
    lazy var statusGL:UILabel = {
        let label = UILabel()
        label.colorSetting(r: 114, g: 223, b: 171, alpha: 1)
        label.textAlignment = .right
        label.text = "답변완료"
        label.font = UIFont(name: "AppleSDGothicNeo-SemiBold", size: 16)
        return label
    }()
    lazy var questionContentsGL:UILabel = {
        let label = UILabel()
        label.colorSetting(r: 189, g: 189, b: 189, alpha: 1)
        label.textAlignment = .left
        label.text = "Lorem ipsum dolor sit amet, consectetur adipiscin"
        label.numberOfLines = 2
        label.font = UIFont(name: "AppleSDGothicNeo-SemiBold", size: 16)
        return label
    }()
    
    lazy var borderBottom: UIView = {
        let view = UIView()
        view.setBackgroundColor(r: 222, g: 222, b: 222, alpha: 1)
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
    
        backgroundColor = .clear
        addContentView()
        autoLayout()
    }
    
    private func addContentView() {
        addSubview(writeDateGL)
        addSubview(statusGL)
        addSubview(questionContentsGL)
        addSubview(borderBottom)
    }
    
    private func autoLayout() {
        writeDateGL.snp.makeConstraints{ make in
            let topRatio = constraintRatio(direction: .top, standardSize: 20)
            let height = aspectRatio(standardSize: 22)
            let fontSize = aspectRatio(standardSize: 16)
            make.top.equalTo(topRatio)
            make.leading.equalTo(22)
            make.height.equalTo(height)
            writeDateGL.font = writeDateGL.font.withSize(fontSize)
        }
        statusGL.snp.makeConstraints{ make in
            let topRatio = constraintRatio(direction: .top, standardSize: 20)
            let height = aspectRatio(standardSize: 22)
            let fontSize = aspectRatio(standardSize: 16)
            make.top.equalTo(topRatio)
            make.trailing.equalTo(-22)
            make.height.equalTo(height)
            statusGL.font = statusGL.font.withSize(fontSize)
        }
        questionContentsGL.snp.makeConstraints{ make in
            let topRatio = constraintRatio(direction: .top, standardSize: 16)
            let fontSize = aspectRatio(standardSize: 16)
            make.top.equalTo(writeDateGL.snp.bottom).offset(topRatio)
            make.leading.equalTo(22)
            make.trailing.equalTo(-22)
            statusGL.font = statusGL.font.withSize(fontSize)
        }
        

        borderBottom.snp.makeConstraints{ make in
            make.top.equalTo(questionContentsGL.snp.bottom).offset(20)
            make.leading.bottom.trailing.equalToSuperview()
            make.height.equalTo(0.5)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
