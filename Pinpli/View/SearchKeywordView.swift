//
//  SearchKeywordView.swift
//  Pinpli
//
//  Created by 남오승 on 2020/12/27.
//

import Foundation
import UIKit
import SnapKit

class SearchKeywordView: BaseView {
   
    lazy var areaListWrap: UIView = {
        let view = UIView()
        return view
    }()
    
    lazy var areaListTV: UITableView = {
        let table = UITableView()
        return table
    }()
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        
        addSubview(areaListWrap)
        areaListWrap.addSubview(areaListTV)

        areaListWrap.snp.makeConstraints{ make in
            make.top.leading.trailing.bottom.equalTo(safeAreaLayoutGuide)
        }
      
        areaListTV.snp.makeConstraints{ make in
            make.top.leading.trailing.bottom.equalTo(areaListWrap)
        }
    }
}
