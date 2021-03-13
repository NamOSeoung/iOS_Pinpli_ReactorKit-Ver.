//
//  ReviewCollectionVC.swift
//  Pinpli
//
//  Created by 남오승 on 2021/03/03.
//

import UIKit
import RxCocoa
import RxGesture

//리뷰 모아보기 리스트
class ReviewCollectionVC: BaseViewController {
    
    var backWrap:UIView? //뒤로가기
    var allWrap:UIView? //전체 카테고리
    var youtubeWrap:UIView? //유튜브 카테고리
    var naverWrap:UIView? //네이버 카테고리
    var tistoryWrap:UIView? //티스토리 카테고리
    var pinpliWrap:UIView? //핀플리 카테고리
    var reviewListCV:UICollectionView? //리뷰 카테고리별 Tab
    
    
    let reviewCollectionViewUI = ReviewCollectionViewUI()
    
    override func viewDidLoad() {
        view = reviewCollectionViewUI
        
        bind()
    }
    
    private func bind() {
        /* UIInit */
        backWrap = reviewCollectionViewUI.backWrap
        allWrap = reviewCollectionViewUI.allWrap
        youtubeWrap = reviewCollectionViewUI.youtubeWrap
        naverWrap = reviewCollectionViewUI.naverWrap
        tistoryWrap = reviewCollectionViewUI.tistoryWrap
        pinpliWrap = reviewCollectionViewUI.pinpliWrap
        reviewListCV = reviewCollectionViewUI.reviewListCV
        
        /* Delegate */
        reviewListCV?.delegate = self
        reviewListCV?.dataSource = self
        
        /* UIAction */
        backWrap?.rx.tapGesture().when(.recognized)
            .bind{[weak self] _ in
                self?.navigationController?.popViewController(animated: true)
            }.disposed(by: disposeBag)
        allWrap?.rx.tapGesture().when(.recognized)
            .bind{[weak self] _ in
                self?.reviewListCV?.scrollToItem(at: IndexPath(row: 0, section: 0), at: .right, animated: true)
                self?.reviewCollectionViewUI.categoryColorSetting(gubun: 0)
            }.disposed(by: disposeBag)
        youtubeWrap?.rx.tapGesture().when(.recognized)
            .bind{[weak self] _ in
                self?.reviewListCV?.scrollToItem(at: IndexPath(row: 1, section: 0), at: .right, animated: true)
                self?.reviewCollectionViewUI.categoryColorSetting(gubun: 1)
            }.disposed(by: disposeBag)
        naverWrap?.rx.tapGesture().when(.recognized)
            .bind{[weak self] _ in
                self?.reviewListCV?.scrollToItem(at: IndexPath(row: 2, section: 0), at: .right, animated: true)
                self?.reviewCollectionViewUI.categoryColorSetting(gubun: 2)
            }.disposed(by: disposeBag)
        tistoryWrap?.rx.tapGesture().when(.recognized)
            .bind{[weak self] _ in
                self?.reviewListCV?.scrollToItem(at: IndexPath(row: 3, section: 0), at: .right, animated: true)
                self?.reviewCollectionViewUI.categoryColorSetting(gubun: 3)
            }.disposed(by: disposeBag)
        pinpliWrap?.rx.tapGesture().when(.recognized)
            .bind{[weak self] _ in
                self?.reviewListCV?.scrollToItem(at: IndexPath(row: 4, section: 0), at: .right, animated: true)
                self?.reviewCollectionViewUI.categoryColorSetting(gubun: 4)
            }.disposed(by: disposeBag)
        
    }
}

extension ReviewCollectionVC: UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell:ReviewCollectionTableCell?
        cell = (collectionView.dequeueReusableCell(withReuseIdentifier: "ReviewCollectionTableCell", for:indexPath) as? ReviewCollectionTableCell)
        cell?.currentCategory = indexPath.row
        cell?.reviewTV.reloadData()

        return cell!
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var width = CGFloat(0.0)
        var height = CGFloat(0.0)
        
        width =  collectionView.frame.width
        height = collectionView.frame.height
        
        let size = CGSize(width: width, height: height)
        
        return size
    }
}

