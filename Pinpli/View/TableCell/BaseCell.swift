//
//  BaseCell.swift
//  Pinpli
//
//  Created by 남오승 on 2020/12/27.
//

import UIKit


class BaseTableCell:UITableViewCell {
    
    var currentViewSize = UIScreen.main.bounds
    let standardWidthSize:CGFloat = 375  //디자인 기준 width
    let standardHeightSize:CGFloat = 812 //디자인 기준 height
    
    //constraint 방향 기준
    enum Direction {
        case top
        case left
        case right
        case bottom
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
       
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //변경할 관계 비율
    func constraintRatio(direction:Direction,standardSize:CGFloat) -> CGFloat{
        var ratio: CGFloat = 0.0
        
        switch direction {
        case .top,.bottom:
            let standardRatio = (standardSize/standardHeightSize)
            ratio = currentViewSize.height * standardRatio
            break
        case .left,.right:
            let standardRatio = (standardSize/standardWidthSize)
            ratio = currentViewSize.width * standardRatio
            break
        }
        
        
        return ratio
    }
    
    //변경할 비율 (view, font)
    func aspectRatio(standardSize:CGFloat) -> CGFloat {
        var ratio: CGFloat = 0.0
        
        let standardRatio = (standardSize/standardWidthSize)
        ratio = currentViewSize.width * standardRatio
        
        return ratio
    }}
