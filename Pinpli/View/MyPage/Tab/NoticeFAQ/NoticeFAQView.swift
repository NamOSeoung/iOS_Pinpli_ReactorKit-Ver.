//
//  NoticeView.swift
//  Pinpli
//
//  Created by 남오승 on 2021/02/03.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa
import ExpyTableView

//공지사항 FAQ 전용 뷰
class NoticeFAQView: BaseView {
    
    lazy var headerWrap:UIView = {
        let view = UIView()
        return view
    }()
    lazy var backWrap:UIView = {
        let view = UIView()
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(backClickEvent(_:))))
        return view
    }()
    lazy var backBtnImage:UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "back_189")
        return image
    }()
    lazy var headerBottom:UIView = {
        let view = UIView()
        view.setBackgroundColor(r: 222, g: 222, b: 222, alpha: 1)
        return view
    }()
    lazy var headerGL:UILabel = {
        let label = UILabel()
        label.colorSetting(r: 31, g: 31, b: 31, alpha: 1)
        label.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 17)
        label.text = "공지사항"
        label.textAlignment = .center
        return label
    }()
    lazy var listTV:ExpyTableView = {
        let tableView = ExpyTableView()
        tableView.backgroundColor = .white
        tableView.delegate = self
        tableView.dataSource = self
        tableView.showsHorizontalScrollIndicator = false
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorStyle = .none
        tableView.register(NoticeFAQCell.self,
                           forCellReuseIdentifier: "NoticeFAQCell")
        return tableView
    }()
    var backEvent:BehaviorRelay<Bool> = BehaviorRelay.init(value: false)
    
    let arraySection0: Array<String> = ["section0_row0","section0_row1","section0_row2"]
    let arraySection1: Array<String> = ["section1_row0","section1_row1section1_row1section1_row1section1_row1section1_row1section1_row1section1_row1section1_row1section1_row1section1_row1section1_row1section1_row1section1_row1section1_row1section1_row1section1_row1section1_row1section1_row1section1_row1section1_row1section1_row1section1_row1section1_row1section1_row1section1_row1section1_row1section1_row1section1_row1section1_row1section1_row1section1_row1section1_row1section1_row1section1_row1section1_row1"]
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        addContentView()
        autoLayout()
    }
    
    func addContentView() {
        addSubview(headerWrap)
        headerWrap.addSubview(backWrap)
        backWrap.addSubview(backBtnImage)
        headerWrap.addSubview(headerGL)
        headerWrap.addSubview(headerBottom)
        addSubview(listTV)
    }
    
    func autoLayout() {
        headerWrap.snp.makeConstraints { (make) in
            let height = aspectRatio(standardSize: 43)
            make.leading.top.trailing.equalTo(safeAreaLayoutGuide)
            make.height.equalTo(height)
        }
        backWrap.snp.makeConstraints { (make) in
            make.leading.top.bottom.equalToSuperview()
            make.width.equalTo(currentViewSize.width/2)
        }
        backBtnImage.snp.makeConstraints { (make) in
            let height = aspectRatio(standardSize: 22)
            let leftRatio = constraintRatio(direction: .left, standardSize: 12)
            make.leading.equalTo(leftRatio)
            make.centerY.equalToSuperview()
            make.height.equalTo(height)
        }
        headerGL.snp.makeConstraints { (make) in
            let fontSize = aspectRatio(standardSize: 17)
            headerGL.font = headerGL.font.withSize(fontSize)
            make.centerX.centerY.equalToSuperview()
        }
        headerBottom.snp.makeConstraints { (make) in
            make.height.equalTo(0.5)
            make.leading.bottom.trailing.equalToSuperview()
        }
        
        listTV.snp.makeConstraints { (make) in
            let topRatio = constraintRatio(direction: .top, standardSize: 10)
            make.top.equalTo(headerWrap.snp.bottom).offset(topRatio)
            make.leading.trailing.bottom.equalTo(safeAreaLayoutGuide)
        }
    }
    
    @objc private func backClickEvent(_ gesture:UITapGestureRecognizer) {
        gesture.view?.showAnimation { [weak self] in
            self?.backEvent.accept(true)
        }
    }
}
extension NoticeFAQView: ExpyTableViewDelegate, ExpyTableViewDataSource {
    func tableView(_ tableView: ExpyTableView, expyState state: ExpyState, changeForSection section: Int) {
        switch state {
        
        case .willExpand:
//            print("WILL EXPAND")
            if let noticeFAQCell = tableView.cellForRow(at: IndexPath(row: 0, section: section)) as? NoticeFAQCell {
                noticeFAQCell.titleGL02.text = "∧"
            }
        case .willCollapse:
            if let noticeFAQCell = tableView.cellForRow(at: IndexPath(row: 0, section: section)) as? NoticeFAQCell {
                noticeFAQCell.titleGL02.text = "∨"
            }
//            print("WILL COLLAPSE")
        case .didExpand:
            break
//            print("DID EXPAND")
        case .didCollapse:
            break
//            print("DID COLLAPSE")
        }
    }
    
    func tableView(_ tableView: ExpyTableView, canExpandSection section: Int) -> Bool {
        return true
    }
    
    func tableView(_ tableView: ExpyTableView, expandableCellForSection section: Int) -> UITableViewCell {
        let noticeFAQCell: NoticeFAQCell = tableView.dequeueReusableCell(withIdentifier: "NoticeFAQCell") as! NoticeFAQCell
        
        return noticeFAQCell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return arraySection0.count
        } else {
            return arraySection1.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let fontSize = aspectRatio(standardSize: 16)
        
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.font = UIFont(name: "AppleSDGothicNeo-Regular", size: fontSize)
        cell.textLabel?.colorSetting(r: 51, g: 51, b: 51, alpha: 1)
        
        if indexPath.section == 0 {
            cell.textLabel?.text = arraySection0[indexPath.row]
        } else {
            cell.textLabel?.text = arraySection1[indexPath.row]
        }
        cell.textLabel?.setLinespace(spacing: 8)
        cell.setBackgroundColor(r: 242, g: 242, b: 242, alpha: 1)
        
        return cell
    }
    
   func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
}
