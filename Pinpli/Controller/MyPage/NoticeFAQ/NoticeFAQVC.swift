//
//  NoticeFAQVC.swift
//  Pinpli
//
//  Created by 남오승 on 2021/02/03.
//

import UIKit
import SnapKit
import ExpyTableView

//공지사항 FAQ VC
class NoticeFAQVC:BaseViewController {
    
    let noticeFAQViewUI = NoticeFAQViewUI()
    let noticeFAQViewModel = NoticeFAQViewModel(faqService: FAQService(),noticeService: NoticeService())
    
    var headerGL:UILabel?
    var listTV:UITableView?
    
    var gubun:Bool = false //true : 공지사항, false : FAQ
    var faqList:[Faq]?
    var noticeList:[Notice]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = noticeFAQViewUI
        
        bind()
    }
    
    private func bind() {
        /* UIInit*/
        headerGL = noticeFAQViewUI.headerGL
        listTV = noticeFAQViewUI.listTV
        
        if gubun {
            headerGL?.text = "공지사항"
        }else {
            headerGL?.text = "자주하는 질문"
        }
        
        /* Delegate Init */
        listTV?.delegate = self
        listTV?.dataSource = self
        
        /* Action */
        noticeFAQViewModel.gubunInput.accept(gubun)
        
        /* UIEvent */
        let isBackEvent = noticeFAQViewUI.backEvent.filter{$0}
        isBackEvent.bind{[weak self] result in
            self?.navigationController?.popViewController(animated: true)
        }.disposed(by: disposeBag)
        /* */
        
        /* State */
        let faqList = noticeFAQViewModel.faqListOutput.filter{$0 != nil}
        let noticeList = noticeFAQViewModel.noticeListOutput.filter{$0 != nil}
        
        faqList.bind{[weak self] result in
            self?.faqList = result
            self?.listTV?.reloadData()
        }.disposed(by: disposeBag)
        
        noticeList.bind{[weak self] result in
            self?.noticeList = result
            self?.listTV?.reloadData()
        }.disposed(by: disposeBag)
    }
}


extension NoticeFAQVC: ExpyTableViewDelegate, ExpyTableViewDataSource {
    func tableView(_ tableView: ExpyTableView, expyState state: ExpyState, changeForSection section: Int) {
        switch state {
        
        case .willExpand: //제목이 열렸을 경우 처리
            if let noticeFAQCell = tableView.cellForRow(at: IndexPath(row: 0, section: section)) as? NoticeFAQCell {
                noticeFAQCell.titleGL02.text = "∧"
            }
        case .willCollapse: //제목이 닫혔을 경우 처리
            if let noticeFAQCell = tableView.cellForRow(at: IndexPath(row: 0, section: section)) as? NoticeFAQCell {
                noticeFAQCell.titleGL02.text = "∨"
            }
        case .didExpand:
            break
        case .didCollapse:
            break
        }
    }
    
    //테이블 여닫이 여부 설정
    func tableView(_ tableView: ExpyTableView, canExpandSection section: Int) -> Bool {
        return true
    }
    
    //제목에 대한 Cell 처리
    func tableView(_ tableView: ExpyTableView, expandableCellForSection section: Int) -> UITableViewCell {
        let noticeFAQCell: NoticeFAQCell = tableView.dequeueReusableCell(withIdentifier: "NoticeFAQCell") as! NoticeFAQCell
        
        if gubun {
            if let subject = noticeList?[section].subject {
                noticeFAQCell.titleGL01.text = subject
            }
        }else {
            if let subject = faqList?[section].subject {
                noticeFAQCell.titleGL01.text = subject
            }
        }
        
        return noticeFAQCell
    }
    
    //리스트 Row 별 헤더 포함 나타낼 줄 수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    //내용에 대한 Cell 처리
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let fontSize = aspectRatio(standardSize: 16)
        
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.font = UIFont(name: "AppleSDGothicNeo-Regular", size: fontSize)
        cell.textLabel?.colorSetting(r: 51, g: 51, b: 51, alpha: 1)
        
        if gubun {
            if let contents = noticeList?[indexPath.section].content {
                cell.textLabel?.text = contents
            }
        }else {
            if let contents = faqList?[indexPath.section].content {
                cell.textLabel?.text = contents
            }
        }
        
        cell.textLabel?.setLinespace(spacing: 8)
        cell.setBackgroundColor(r: 242, g: 242, b: 242, alpha: 1)
        cell.selectionStyle = .none
        return cell
    }
    
    //섹션 갯수(리스트 헤더 갯수)
    func numberOfSections(in tableView: UITableView) -> Int {
        if gubun {
            return noticeList?.count ?? 0
        }else {
            return faqList?.count ?? 0
        }
    }
}
