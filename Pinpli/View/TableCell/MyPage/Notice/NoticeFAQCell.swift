//
//  NoticeFAQCell.swift
//  Pinpli
//
//  Created by 남오승 on 2021/02/05.
//

import UIKit
//공지사항, FAQ 전용 Cell
class NoticeFAQCell:BaseTableCell {
    
    lazy var titleGL01:UILabel = {
        let label = UILabel()
        label.text = "일이삼사오육칠팔구십일이삼사오육칠팔구십일이삼사오육칠팔구십일이삼사오육칠팔구십"
        label.colorSetting(r: 51, g: 51, b: 51, alpha: 1)
        label.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 16)
        return label
    }()
    lazy var titleGL02:UILabel = {
        let label = UILabel()
        label.text = "∨"
        label.colorSetting(r: 51, g: 51, b: 51, alpha: 1)
        label.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 16)
        return label
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
    
        backgroundColor = .clear
        addContentView()
        autoLayout()
    }
    
    private func addContentView() {
        addSubview(titleGL01)
        addSubview(titleGL02)
    }
    
    private func autoLayout() {
        titleGL02.snp.makeConstraints { (make) in
            let fontSize = aspectRatio(standardSize: 16)
            titleGL02.font = titleGL02.font.withSize(fontSize)
            make.centerY.equalToSuperview()
            make.trailing.equalTo(-22)
        }
        titleGL01.snp.makeConstraints { (make) in
            let height = aspectRatio(standardSize: 51)
            make.height.equalTo(height)
            make.leading.equalTo(22)
            make.trailing.equalTo(titleGL02.snp.leading).offset(-26)
            make.top.bottom.equalToSuperview()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
