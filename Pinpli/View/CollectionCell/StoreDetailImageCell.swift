//
//  StoreDetailImageCell.swift
//  Pinpli
//
//  Created by 남오승 on 2021/01/05.
//

import UIKit

//가게 상세 헤더 이미지  CollectionCell
class StoreDetailImageCell: BaseCollectionCell {
    
    lazy var headerImage:UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "image 37")
        return image
    }()
 

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        bindConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
        bindConstraints()
    }
    
    private func setup() {
        /* 헤더 이미지 */
        addSubview(headerImage)
        /* */
    }
    
    private func bindConstraints() {
      
        /* 썸네일 */
        headerImage.snp.makeConstraints{ make in
            make.top.leading.trailing.bottom.equalTo(0)
        }
    }
}
