//
//  AreaFirstCell.swift
//  Pinpli
//
//  Created by 남오승 on 2020/12/27.
//

import UIKit

class AreaFirstCell:UITableViewCell {
    
    lazy var areaNameGL:UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont(name: "AppleSDGothicNeo-SemiBold", size: 16)
        return label
    }()
    
    lazy var borderRight: UIView = {
        let view = UIView()
        view.setBackgroundColor(r: 51, g: 51, b: 51, alpha: 1)
        view.isHidden = true
        return view
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
        contentView.addSubview(areaNameGL)
        contentView.addSubview(borderRight)
        contentView.addSubview(borderBottom)
    }
    
    private func autoLayout() {
        areaNameGL.snp.makeConstraints{ make in
            make.top.leading.bottom.equalTo(contentView)
            make.trailing.equalTo(borderRight.snp.leading)
            make.height.equalTo(50)
        }
        
        borderRight.snp.makeConstraints{ make in
            make.width.equalTo(5)
            make.top.equalTo(contentView.snp.top)
            make.bottom.equalTo(contentView.snp.bottom)
            make.trailing.equalTo(contentView.snp.trailing)
        }
        
        borderBottom.snp.makeConstraints{ make in
            make.leading.equalTo(contentView.snp.leading)
            make.trailing.equalTo(borderRight.snp.leading)
            make.bottom.equalTo(contentView.snp.bottom)
            make.height.equalTo(0.5)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
