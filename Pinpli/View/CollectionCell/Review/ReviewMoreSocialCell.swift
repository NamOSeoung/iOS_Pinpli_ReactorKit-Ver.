//
//  ReviewMoreSocialCell.swift
//  Pinpli
//
//  Created by 남오승 on 2021/01/25.
//

import UIKit

//리뷰더보기 소셜 전용 Cell
class ReviewMoreSocialCell: BaseTableCell {
    
    lazy var headerViewWrap:UIView = {
        let view = UIView()
        return view
    }()
    lazy var profileImageWrap:UIView = {
        let view = UIView()
        //        view.layer.masksToBounds = true //이부분 설정 시 이 안에 addSubView하는 모든 뷰는 이 테두리안에서 논다.
        view.backgroundColor = .blue
        return view
    }()
    lazy var profileImage:UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.image = UIImage(named: "image7")
        return image
    }()
    
    lazy var titleGL:UILabel = {
        let label = UILabel()
        label.text = "여긴 상점이다으다으"
        label.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 14)
        label.colorSetting(r: 31, g: 31, b: 31, alpha: 1)
        return label
    }()
    lazy var subjectGL:UILabel = {
        let label = UILabel()
        label.text = "#2 VLOG | 남양주 / 별내 / 카페거리 / ollien / 올리앤 / 빌리엔젤 / 다이소"
        label.font = UIFont(name: "AppleSDGothicNeo-SemiBold", size: 16)
        label.colorSetting(r: 31, g: 31, b: 31, alpha: 1)
        label.numberOfLines = 2
        return label
    }()
    lazy var ratingGL:UILabel = {
        let label = UILabel()
        label.text = "★ 4/5 점"
        label.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 14)
        label.colorSetting(r: 31, g: 31, b: 31, alpha: 1)
        return label
    }()
    lazy var contentsWrap:UIView = {
        let view = UIView()
        view.layer.masksToBounds = true //이부분 설정 시 이 안에 addSubView하는 모든 뷰는 이 테두리안에서 논다.
        return view
    }()
    lazy var thumbnailImage:UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleToFill
        image.image = UIImage(named: "image7")
        return image
    }()
    lazy var contentsText:VerticalAlignLabel = {
        let label = VerticalAlignLabel()
        label.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 12)
        label.text = "일이삼사오육칠팔구십일이삼사오육칠팔구십일이삼사오육칠팔구십일이삼사"
        label.colorSetting(r: 130, g: 130, b: 130, alpha: 1)
        label.baselineAdjustment = .alignBaselines
        label.verticalAlignment = .top
        label.numberOfLines = 0
        return label
    }()
    lazy var contentsTextBtn:UIButton = {
        let button = UIButton()
        button.titleLabel?.lineBreakMode = .byTruncatingTail
        button.titleLabel?.numberOfLines = 0
        button.titleLabel?.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 12)
        button.setTitleColor(r: 130, g: 130, b: 130, alpha: 1, ctrl: .normal)
        
        //        button.titleLabel?.lineBreakMode = .
        button.setTitle("일이삼사오육칠팔구십일이삼사오육칠팔구십일이삼사오육칠팔구십일이삼사오육칠팔구십일이삼사오육칠팔구십일이삼사오육칠팔구십일이삼사오육칠팔구십일이삼사오육칠일이삼사오육칠팔구십일이삼사오육칠팔구십일이삼사오육칠팔구십일이삼사오육칠팔구십일이삼사오육칠팔구십일이삼사오육칠팔구십일이삼사오육칠팔구십일이삼사오육칠", for: .normal)
        //        button.titleLabel?.text = "일이삼사오육칠팔구십일이삼사오육칠팔구십일이삼사오육칠팔구십일이삼사오육칠팔구십일이삼사오육칠팔구십일이삼사오육칠팔구십일이삼사오육칠팔구십일이삼사오육칠"
        //        button.titleLabel?.colorSetting(r: 130, g: 130, b: 130, alpha: 1)
        button.titleLabel?.contentMode = .top
        button.isUserInteractionEnabled = false
        return button
    }()
    lazy var contentsRightTextView:UITextView = {
        let textView = UITextView()
        textView.text = "일이삼사오육칠팔구십일이삼사오육칠팔구십일이삼사오육칠팔구십일이삼사오육칠팔구십일이삼사오육칠팔구십일이삼사오육칠팔구십일이삼사오육칠팔구십일이삼사오육칠"
        textView.backgroundColor = .white
        textView.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 12)
        textView.colorSetting(r: 130, g: 130, b: 130, alpha: 1)
        textView.isEditable = false
        textView.isSelectable = false
        textView.textContainerInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        textView.isUserInteractionEnabled = false
        return textView
    }()
    lazy var writerGL:UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 12)
        label.colorSetting(r: 204, g: 204, b: 204, alpha: 1)
        label.textAlignment = .right
        return label
    }()
    lazy var writeDateGL:UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 12)
        label.colorSetting(r: 204, g: 204, b: 204, alpha: 1)
        label.textAlignment = .right
        return label
    }()
    lazy var viewCntGL:UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 12)
        label.colorSetting(r: 204, g: 204, b: 204, alpha: 1)
        label.textAlignment = .left
        return label
    }()
    lazy var thumbnailImageCntWrap:UIView = {
        let view = UIView()
        view.setBackgroundColor(r: 0, g: 0, b: 0, alpha: 0.5)
        return view
    }()
    lazy var thumbnailImageCntGL:UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 16)
        label.textColor = .white
        label.textAlignment = .center
        label.text = "+ 3"
        return label
    }()
    lazy var contentsTextView:UITextView = {
        let textView = UITextView()
        textView.backgroundColor = .white
        textView.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 16)
        textView.colorSetting(r: 0, g: 0, b: 0, alpha: 1)
        textView.isEditable = false
        textView.isSelectable = false
        textView.textContainerInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        textView.isUserInteractionEnabled = false
        
        return textView
    }()
    
    lazy var cellBottom:UIView = {
        let view = UIView()
        view.setBackgroundColor(r: 242, g: 242, b: 242, alpha: 1)
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        backgroundColor = .clear
        setup()
        bindConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
        bindConstraints()
    }
    
    private func setup() {
        /* 헤더 */
        addSubview(headerViewWrap)
        headerViewWrap.addSubview(profileImageWrap)
        addSubview(subjectGL)
        
        //        addSubview(thumbnailImage)
        //        profileImageWrap.addSubview(profileImage)
        //        headerViewWrap.addSubview(titleGL)
        //        headerViewWrap.addSubview(ratingGL)
        //        headerViewWrap.addSubview(writeDateGL)
        addSubview(cellBottom)
        /* */
    }
    
    private func bindConstraints() {
        headerViewWrap.snp.makeConstraints{ make in
            let topRatio = constraintRatio(direction: .top, standardSize: 20)
            let height = aspectRatio(standardSize: 20)
            make.height.equalTo(height)
            make.leading.equalTo(23)
            make.trailing.equalTo(-23)
            make.top.equalTo(topRatio)
        }
        subjectGL.snp.makeConstraints{ make in
            let topRatio = constraintRatio(direction: .top, standardSize: 18)
            
            let fontSize = aspectRatio(standardSize: 16)
            make.top.equalTo(topRatio)
            //            make.height.equalTo(height)
            make.leading.equalTo(22)
            make.trailing.equalTo(-22)
            subjectGL.font = subjectGL.font.withSize(fontSize)
        }
        
        
        
        //        thumbnailImage.snp.makeConstraints{ make in
        //            let topRatio = constraintRatio(direction: .top, standardSize: 10)
        //            let bottomRatio = constraintRatio(direction: .bottom, standardSize: 30)
        //            let width = aspectRatio(standardSize: 180)
        //            let height = aspectRatio(standardSize: 140)
        //            make.width.equalTo(width)
        //            make.height.equalTo(height)
        //            make.leading.equalTo(23)
        //            make.top.equalTo(subjectGL.snp.bottom).offset(topRatio)
        //            make.bottom.equalTo(cellBottom.snp.top).offset(-30)
        //
        //        }
        //        profileImageWrap.snp.makeConstraints{ make in
        //            let width = aspectRatio(standardSize: 20)
        //            make.width.height.equalTo(width)
        //            make.top.bottom.leading.equalToSuperview()
        //            profileImageWrap.layer.cornerRadius = width/2
        //        }
        //        profileImage.snp.makeConstraints{ make in
        //            make.leading.top.trailing.bottom.equalToSuperview()
        //        }
        //        titleGL.snp.makeConstraints{ make in
        //            let fontSize = aspectRatio(standardSize: 14)
        //            make.left.equalTo(profileImageWrap.snp.right).offset(8)
        //            make.top.equalToSuperview()
        //            make.centerY.equalToSuperview()
        //            titleGL.font = titleGL.font.withSize(fontSize)
        //        }
        //        ratingGL.snp.makeConstraints{ make in
        //            let width = aspectRatio(standardSize: 54)
        //            let fontSize = aspectRatio(standardSize: 14)
        //            make.top.centerY.equalToSuperview()
        //            make.leading.equalTo(titleGL.snp.trailing).offset(4)
        //            make.width.equalTo(width)
        //            ratingGL.font = ratingGL.font.withSize(fontSize)
        //        }
        //        writeDateGL.snp.makeConstraints{ make in
        //            let width = aspectRatio(standardSize: 44)
        //            let fontSize = aspectRatio(standardSize: 12)
        //            make.width.equalTo(width)
        //            make.top.equalToSuperview()
        //            make.trailing.equalToSuperview()
        //            make.centerY.equalToSuperview()
        //            writeDateGL.font = writeDateGL.font.withSize(fontSize)
        //        }
        cellBottom.snp.makeConstraints{ make in
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(10)
            make.bottom.equalToSuperview()
        }
    }
    
    func rowDataSetting(socialGubun:Int, thumbnailUrl:String, contents:String) {
        for view in subviews {
            if view == contentsWrap{
                view.removeFromSuperview()
            }
        }
        
        if socialGubun == 0 { //유튜브
            addSubview(contentsWrap)
            contentsWrap.addSubview(thumbnailImage)
            contentsWrap.addSubview(writerGL)
            contentsWrap.addSubview(viewCntGL)
            contentsWrap.addSubview(writeDateGL)
            contentsWrap.addSubview(contentsText)
            
            contentsWrap.snp.makeConstraints{ make in
                let height = aspectRatio(standardSize: 140)
                let topRatio = constraintRatio(direction: .top, standardSize: 10)
                let bottomRatio = constraintRatio(direction: .bottom, standardSize: 30)
                make.height.equalTo(height)
                make.leading.equalTo(23)
                make.trailing.equalTo(-23)
                make.top.equalTo(subjectGL.snp.bottom).offset(topRatio)
                make.bottom.equalTo(cellBottom.snp.top).offset(-bottomRatio)
            }
            thumbnailImage.snp.makeConstraints{ make in
                let width = aspectRatio(standardSize: 180)
                let height = aspectRatio(standardSize: 140)
                make.top.leading.bottom.equalToSuperview()
                make.height.equalTo(height)
                make.width.equalTo(width)
            }
            writerGL.snp.makeConstraints{ make in
                let fontSize = aspectRatio(standardSize: 12)
                let bottomRatio = constraintRatio(direction: .bottom, standardSize: 2)
                let height = aspectRatio(standardSize: 16)
                writerGL.font = writerGL.font.withSize(fontSize)
                make.trailing.equalToSuperview()
                make.height.equalTo(height)
                make.leading.equalTo(thumbnailImage.snp.trailing).offset(16)
                make.bottom.equalTo(writeDateGL.snp.top).offset(-bottomRatio)
                writerGL.text = "주린이"
                writerGL.textAlignment = .left
                writerGL.backgroundColor = .green
            }
            viewCntGL.snp.makeConstraints{ make in
                let width = aspectRatio(standardSize: 67)
                let height = aspectRatio(standardSize: 16)
                let fontSize = aspectRatio(standardSize: 12)
                make.leading.equalTo(thumbnailImage.snp.trailing).offset(16)
                make.width.equalTo(width)
                make.height.equalTo(height)
                make.bottom.equalToSuperview()
                viewCntGL.text = "조회수 227회"
                viewCntGL.font = viewCntGL.font.withSize(fontSize)
            }
            contentsText.snp.makeConstraints{ make in
                let fontSize = aspectRatio(standardSize: 12)
                let bottomRatio = constraintRatio(direction: .bottom, standardSize: 10)
                make.leading.equalTo(thumbnailImage.snp.trailing).offset(16)
                make.top.trailing.equalToSuperview()
                make.bottom.equalTo(writerGL.snp.top).offset(-bottomRatio)
                contentsText.font = contentsText.font.withSize(fontSize)
                contentsText.backgroundColor = .yellow
                contentsText.sizeToFit()
            }
            
            writeDateGL.snp.makeConstraints{ make in
                let height = aspectRatio(standardSize: 16)
                let fontSize = aspectRatio(standardSize: 12)
                
                make.leading.equalTo(viewCntGL.snp.trailing).offset(0)
                make.trailing.bottom.equalToSuperview()
                make.height.equalTo(height)
                writeDateGL.text = "2020.03.03"
                writeDateGL.font = writeDateGL.font.withSize(fontSize)
                
            }
        }else if socialGubun == 1 { //네이버
            
            if thumbnailUrl.count > 0 { //썸네일이 존재함
                addSubview(contentsWrap)
                contentsWrap.addSubview(writerGL)
                contentsWrap.addSubview(writeDateGL)
                contentsWrap.addSubview(thumbnailImage)
                contentsWrap.addSubview(contentsText)
                
                contentsWrap.snp.makeConstraints{ make in
                    let height = aspectRatio(standardSize: 140)
                    let topRatio = constraintRatio(direction: .top, standardSize: 10)
                    let bottomRatio = constraintRatio(direction: .bottom, standardSize: 30)
                    make.height.equalTo(height)
                    make.leading.equalTo(23)
                    make.trailing.equalTo(-23)
                    make.top.equalTo(subjectGL.snp.bottom).offset(topRatio)
                    make.bottom.equalTo(cellBottom.snp.top).offset(-bottomRatio)
                }
                thumbnailImage.snp.makeConstraints{ make in
                    let width = aspectRatio(standardSize: 180)
                    let height = aspectRatio(standardSize: 140)
                    make.top.leading.bottom.equalToSuperview()
                    make.height.equalTo(height)
                    make.width.equalTo(width)
                }
                writerGL.snp.makeConstraints{ make in
                    let fontSize = aspectRatio(standardSize: 12)
                    let bottomRatio = constraintRatio(direction: .bottom, standardSize: 2)
                    let height = aspectRatio(standardSize: 16)
                    writerGL.font = writerGL.font.withSize(fontSize)
                    make.trailing.equalToSuperview()
                    make.height.equalTo(height)
                    make.leading.equalTo(thumbnailImage.snp.trailing).offset(16)
                    make.bottom.equalTo(writeDateGL.snp.top).offset(-bottomRatio)
                    writerGL.text = "주린이"
                    writerGL.textAlignment = .right
                }
                
                contentsText.snp.makeConstraints{ make in
                    let fontSize = aspectRatio(standardSize: 12)
                    let bottomRatio = constraintRatio(direction: .bottom, standardSize: 10)
                    make.leading.equalTo(thumbnailImage.snp.trailing).offset(16)
                    make.top.trailing.equalToSuperview()
                    make.bottom.equalTo(writerGL.snp.top).offset(-bottomRatio)
                    contentsText.font = contentsText.font.withSize(fontSize)
                }
                
                writeDateGL.snp.makeConstraints{ make in
                    let height = aspectRatio(standardSize: 16)
                    let fontSize = aspectRatio(standardSize: 12)
                    
                    make.leading.equalTo(thumbnailImage.snp.trailing).offset(16)
                    make.trailing.bottom.equalToSuperview()
                    make.height.equalTo(height)
                    writeDateGL.text = "2020.03.03"
                    writeDateGL.font = writeDateGL.font.withSize(fontSize)
                    writeDateGL.textAlignment = .right
                }
            }else {
                addSubview(contentsText)
                addSubview(writerGL)
                addSubview(writeDateGL)
                contentsText.snp.makeConstraints{ make in
                    let fontSize = aspectRatio(standardSize: 12)
                    let topRatio = constraintRatio(direction: .top, standardSize: 10)
                    make.top.equalTo(subjectGL.snp.bottom).offset(topRatio)
                    make.leading.equalTo(23)
                    make.trailing.equalTo(-23)
                    contentsText.numberOfLines = 6
                    contentsText.font = contentsText.font.withSize(fontSize)
                }
                writerGL.snp.makeConstraints{ make in
                    let fontSize = aspectRatio(standardSize: 12)
                    let topRatio = constraintRatio(direction: .top, standardSize: 10)
                    let bottomRatio = constraintRatio(direction: .bottom, standardSize: 2)
                    writerGL.font = writerGL.font.withSize(fontSize)
                    make.leading.equalTo(22)
                    make.trailing.equalTo(-22)
                    make.bottom.equalTo(writeDateGL.snp.top).offset(-bottomRatio)
                    make.top.equalTo(contentsText.snp.bottom).offset(topRatio)
                    writerGL.text = "주린이"
                    writerGL.textAlignment = .right
                }
                writeDateGL.snp.makeConstraints{ make in
                    let fontSize = aspectRatio(standardSize: 12)
                    let bottomRatio = constraintRatio(direction: .bottom, standardSize: 30)
                    make.leading.equalTo(22)
                    make.trailing.equalTo(-22)
                    make.bottom.equalTo(cellBottom.snp.top).offset(-bottomRatio)
                    writeDateGL.text = "2020.03.03"
                    writeDateGL.font = writeDateGL.font.withSize(fontSize)
                    writeDateGL.textAlignment = .right
                }
            }
        }else { //티스토리
            if thumbnailUrl.count > 0 { //썸네일이 존재함
                addSubview(contentsWrap)
                contentsWrap.addSubview(writerGL)
                contentsWrap.addSubview(writeDateGL)
                contentsWrap.addSubview(viewCntGL)
                contentsWrap.addSubview(thumbnailImage)
                contentsWrap.addSubview(contentsText)
                
                contentsWrap.snp.makeConstraints{ make in
                    let height = aspectRatio(standardSize: 140)
                    let topRatio = constraintRatio(direction: .top, standardSize: 10)
                    let bottomRatio = constraintRatio(direction: .bottom, standardSize: 30)
                    make.height.equalTo(height)
                    make.leading.equalTo(23)
                    make.trailing.equalTo(-23)
                    make.top.equalTo(subjectGL.snp.bottom).offset(topRatio)
                    make.bottom.equalTo(cellBottom.snp.top).offset(-bottomRatio)
                }
                thumbnailImage.snp.makeConstraints{ make in
                    let width = aspectRatio(standardSize: 180)
                    let height = aspectRatio(standardSize: 140)
                    make.top.leading.bottom.equalToSuperview()
                    make.height.equalTo(height)
                    make.width.equalTo(width)
                }
                viewCntGL.snp.makeConstraints{ make in
                    let width = aspectRatio(standardSize: 67)
                    let height = aspectRatio(standardSize: 16)
                    let fontSize = aspectRatio(standardSize: 12)
                    make.leading.equalTo(thumbnailImage.snp.trailing).offset(16)
                    make.width.equalTo(width)
                    make.height.equalTo(height)
                    make.bottom.equalToSuperview()
                    viewCntGL.text = "조회수 227회"
                    viewCntGL.font = viewCntGL.font.withSize(fontSize)
                }
                writerGL.snp.makeConstraints{ make in
                    let fontSize = aspectRatio(standardSize: 12)
                    let bottomRatio = constraintRatio(direction: .bottom, standardSize: 2)
                    let height = aspectRatio(standardSize: 16)
                    writerGL.font = writerGL.font.withSize(fontSize)
                    make.trailing.equalToSuperview()
                    make.height.equalTo(height)
                    make.leading.equalTo(thumbnailImage.snp.trailing).offset(16)
                    make.bottom.equalTo(writeDateGL.snp.top).offset(-bottomRatio)
                    writerGL.text = "주린이"
                    writerGL.textAlignment = .right
                }
                
                contentsText.snp.makeConstraints{ make in
                    let fontSize = aspectRatio(standardSize: 12)
                    let bottomRatio = constraintRatio(direction: .bottom, standardSize: 10)
                    make.leading.equalTo(thumbnailImage.snp.trailing).offset(16)
                    make.top.trailing.equalToSuperview()
                    make.bottom.equalTo(writerGL.snp.top).offset(-bottomRatio)
                    contentsText.font = contentsText.font.withSize(fontSize)
                }
                
                writeDateGL.snp.makeConstraints{ make in
                    let height = aspectRatio(standardSize: 16)
                    let fontSize = aspectRatio(standardSize: 12)

                    make.leading.equalTo(viewCntGL.snp.trailing).offset(0)
                    make.trailing.bottom.equalToSuperview()
                    make.height.equalTo(height)
                    writeDateGL.text = "2020.03.03"
                    writeDateGL.font = writeDateGL.font.withSize(fontSize)
                    writeDateGL.textAlignment = .right
                }
            }else {
                addSubview(contentsText)
                addSubview(viewCntGL)
                addSubview(writerGL)
                addSubview(writeDateGL)
                contentsText.snp.makeConstraints{ make in
                    let fontSize = aspectRatio(standardSize: 12)
                    let topRatio = constraintRatio(direction: .top, standardSize: 10)
                    make.top.equalTo(subjectGL.snp.bottom).offset(topRatio)
                    make.leading.equalTo(23)
                    make.trailing.equalTo(-23)
                    contentsText.numberOfLines = 6
                    contentsText.font = contentsText.font.withSize(fontSize)
                }
                viewCntGL.snp.makeConstraints{ make in
                    let width = aspectRatio(standardSize: 67)
                    let height = aspectRatio(standardSize: 16)
                    let fontSize = aspectRatio(standardSize: 12)
                    let bottomRatio = constraintRatio(direction: .bottom, standardSize: 30)
                    make.leading.equalToSuperview().offset(16)
                    make.width.equalTo(width)
                    make.height.equalTo(height)
                    make.bottom.equalTo(cellBottom).offset(-bottomRatio)
                    viewCntGL.backgroundColor = .yellow
                    viewCntGL.text = "조회수 227회"
                    viewCntGL.font = viewCntGL.font.withSize(fontSize)
                }
                writerGL.snp.makeConstraints{ make in
                    let fontSize = aspectRatio(standardSize: 12)
                    let topRatio = constraintRatio(direction: .top, standardSize: 10)
                    let bottomRatio = constraintRatio(direction: .bottom, standardSize: 2)
                    writerGL.font = writerGL.font.withSize(fontSize)
                    make.leading.equalTo(22)
                    make.trailing.equalTo(-22)
                    make.bottom.equalTo(writeDateGL.snp.top).offset(-bottomRatio)
                    make.top.equalTo(contentsText.snp.bottom).offset(topRatio)
                    writerGL.text = "주린이"
                    writerGL.textAlignment = .right
                }
                writeDateGL.snp.makeConstraints{ make in
                    let fontSize = aspectRatio(standardSize: 12)
                    let height = aspectRatio(standardSize: 16)
                    make.leading.equalTo(viewCntGL.snp.trailing).offset(0)
                    make.trailing.equalTo(-22)
                    make.bottom.equalTo(viewCntGL.snp.bottom)
                    make.height.equalTo(height)
                    writeDateGL.backgroundColor = .blue
                    writeDateGL.text = "2020.03.03"
                    writeDateGL.font = writeDateGL.font.withSize(fontSize)
                    writeDateGL.textAlignment = .right
                }
            }
        }
    }
}


