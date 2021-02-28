//
//  SearchKeywordVC.swift
//  Pinpli
//
//  Created by 남오승 on 2021/01/26.
//

import UIKit
import SnapKit
import RxCocoa
import RxSwift

//키워드 검색화면
class SearchKeywordVC:BaseViewController {
    
    let searchKeywordViewUI = SearchKeywordViewUI()
    
    var searchKeywordViewModel: SearchKeywordViewModel = SearchKeywordViewModel()
    
    var keywordTF:UITextField?
    var keywordGL:UILabel?
    var closeBtn:UIButton?
    var keywordDelBtn:UIButton?
    var keywordListTV:UITableView?
    var hotKeywordBtn:UIButton?
    var recentlyKeywordBtn:UIButton?
    var keywordSelectBottom:UIView?
    var keywordSelectHeight:NSLayoutConstraint?
    var keywordSelectWrap:UIView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = searchKeywordViewUI
        bind()
    }
    
    private func bind() {
        keywordTF = searchKeywordViewUI.keywordTF
        keywordGL = searchKeywordViewUI.keywordGL
        closeBtn = searchKeywordViewUI.closeBtn
        keywordDelBtn = searchKeywordViewUI.keywordDelBtn
        keywordListTV = searchKeywordViewUI.keywordListTV
        hotKeywordBtn = searchKeywordViewUI.hotKeywordBtn
        recentlyKeywordBtn = searchKeywordViewUI.recentlyKeywordBtn
        keywordSelectBottom = searchKeywordViewUI.keywordSelectBottom
        keywordSelectHeight = searchKeywordViewUI.keywordSelectHeight
        keywordSelectWrap = searchKeywordViewUI.keywordSelectWrap
        
        keywordListTV?.delegate = self
        keywordListTV?.dataSource = self
        
        keywordTF?.becomeFirstResponder()
        
        /* UIEvent */
        closeBtn?.rx.tap.asDriver()
            .drive(onNext:{ [weak self] result in
                self?.closeBtn?.showAnimation {
                    self?.dismiss(animated: true, completion: nil)
                }
            }).disposed(by: disposeBag)
        
        //ViewModel Input
        let keywordDelInput = SearchKeywordViewModel.KeywordDeleteInput(keywordDeleteAction: (keywordDelBtn?.rx.tap.asObservable())!)
        let hotKeywordInput = SearchKeywordViewModel.HotKeywordInput(hotKeywordAction: (hotKeywordBtn?.rx.tap.asObservable())!)
        let recentlyKeywordInput = SearchKeywordViewModel.RecentlyKeywordInput(recentlyKeywordAction: (recentlyKeywordBtn?.rx.tap.asObservable())!)
        
        //ViewModel Output
        let keywordDelOutput = searchKeywordViewModel.keywordDelete(input: keywordDelInput)
        let hotKeywordOutput = searchKeywordViewModel.hotKeyword(input: hotKeywordInput)
        let recentlyKeywordOutput = searchKeywordViewModel.recentlyKeyword(input: recentlyKeywordInput)
        
        
        keywordDelOutput.keywordDelete.drive(onNext:{ [weak self] result in
            self?.keywordTF?.text = result
        }).disposed(by: disposeBag)
        
        recentlyKeywordOutput.recentlykeywordList.drive(onNext:{ [weak self] result in
            print(result)
            self?.keywordBtnSetting(gubun: false)
        }).disposed(by: disposeBag)
        
        hotKeywordOutput.hotKeywordList.drive(onNext:{ [weak self] result in
            print(result)
            self?.keywordBtnSetting(gubun: true)
        }).disposed(by: disposeBag)
        
        keywordTF?.rx.controlEvent(.editingDidEnd)
            .asDriver()
            .drive(onNext:{ [weak self] _ in
                print(111)
                self?.keywordTFSetting(gubun: true)
            }).disposed(by: disposeBag)
        
        keywordTF?.rx.controlEvent(.editingDidBegin)
            .asDriver()
            .drive(onNext:{ [weak self] _ in
                print("222")
                self?.keywordTFSetting(gubun: false)
            }).disposed(by: disposeBag)
    }
    
    //키워드 구분 버튼 밑줄 세팅
    func keywordBtnSetting(gubun:Bool) {
        if gubun { // 요즘 핫한 키워드는?
            hotKeywordBtn?.setTitleColor(r: 51, g: 51, b: 51, alpha: 1, ctrl: .normal)
            recentlyKeywordBtn?.setTitleColor(r: 204, g: 204, b: 204, alpha: 1, ctrl: .normal)
            UIView.animate(withDuration: 0.25, animations: { [weak self] in
                self?.keywordSelectBottom?.frame.origin.x = 0
            })
        }else { //최근 검색한 키워드
            hotKeywordBtn?.setTitleColor(r: 204, g: 204, b: 204, alpha: 1, ctrl: .normal)
            recentlyKeywordBtn?.setTitleColor(r: 51, g: 51, b: 51, alpha: 1, ctrl: .normal)
            UIView.animate(withDuration: 0.25, animations: { [weak self] in
                self?.keywordSelectBottom?.frame.origin.x = ((self?.currentViewSize.width ?? 375)/2)
            })
        }
    }
    
    //키워드 작성란 세팅
    func keywordTFSetting(gubun:Bool) {
        if gubun { //키워드 작성란 숨김
            keywordGL?.isHidden = false
            keywordTF?.isHidden = true
            keywordSelectWrap?.isHidden = false
            let height = aspectRatio(standardSize: 52)
            keywordSelectHeight?.constant = height
            keywordSelectBottom?.isHidden = false
            keywordDelBtn?.isHidden = true
        }else { //키워드 작성란 노출
            keywordGL?.isHidden = true
            keywordTF?.isHidden = false
            keywordSelectHeight?.constant = 0
            keywordSelectBottom?.isHidden = true
            keywordTF?.becomeFirstResponder()
            keywordSelectWrap?.isHidden = true
            keywordDelBtn?.isHidden = false
        }
    }
}

extension SearchKeywordVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let areaSecondCell: AreaSecondCell = tableView.dequeueReusableCell(withIdentifier: "AreaSecondCell") as! AreaSecondCell
        
        areaSecondCell.areaNameGL.text = "서울 동작구"
        
        return areaSecondCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
