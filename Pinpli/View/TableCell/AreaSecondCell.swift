//
//  AreaSecondCell.swift
//  Pinpli
//
//  Created by 남오승 on 2020/12/27.
//

import UIKit

class AreaSecondCell:UITableViewCell {
    
    lazy var areaViewWrap: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    lazy var areaNameGL:UILabel = {
        let label = UILabel()
        label.colorSetting(r: 51, g: 51, b: 51, alpha: 1)
        label.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 16)
        label.textAlignment = .left
        
        return label
    }()
    
    lazy var rightGL:UILabel = {
        let label = UILabel()
        label.colorSetting(r: 51, g: 51, b: 51, alpha: 1)
        label.textAlignment = .right
        label.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 16)
        label.text = ">"
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
        contentView.addSubview(areaViewWrap)
        areaViewWrap.addSubview(areaNameGL)
        areaViewWrap.addSubview(rightGL)
    }
    
    private func autoLayout() {
        
        areaViewWrap.snp.makeConstraints{ make in
            make.top.bottom.leading.trailing.equalTo(contentView)
        }
        areaNameGL.snp.makeConstraints{ make in
            make.top.bottom.equalTo(contentView)
            make.leading.equalTo(20)
            make.trailing.equalTo(rightGL.snp.leading)
            make.height.equalTo(50)
        }
        rightGL.snp.makeConstraints{ make in
            make.centerY.equalTo(contentView)
            make.trailing.equalTo(-22)
            make.width.equalTo(10)
            make.height.equalTo(21)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
