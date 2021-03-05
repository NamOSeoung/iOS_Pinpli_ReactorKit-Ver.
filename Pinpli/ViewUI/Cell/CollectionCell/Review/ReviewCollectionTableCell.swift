//
//  ReviewCollectionTableCell.swift
//  Pinpli
//
//  Created by 남오승 on 2021/03/04.
//

import UIKit

class ReviewCollectionTableCell: BaseCollectionCell {
    
    lazy var reviewTV:UITableView = {
        let table = UITableView()
        table.dataSource = self
        table.delegate = self
        table.separatorStyle = .none
        table.keyboardDismissMode = .onDrag
        table.showsHorizontalScrollIndicator = false
        table.showsVerticalScrollIndicator = false
        table.register(ReviewCollectionYoutubeCell.self,
                       forCellReuseIdentifier: "ReviewCollectionYoutubeCell")
        table.register(ReviewCollectionNaverOnlyTextCell.self,
                       forCellReuseIdentifier: "ReviewCollectionNaverOnlyTextCell")
        table.register(ReviewCollectionNaverImageTextCell.self,
                       forCellReuseIdentifier: "ReviewCollectionNaverImageTextCell")
        table.register(ReviewCollectionTistoryOnlyTextCell.self,
                       forCellReuseIdentifier: "ReviewCollectionTistoryOnlyTextCell")
        table.register(ReviewCollectionTistoryImageTextCell.self,
                       forCellReuseIdentifier: "ReviewCollectionTistoryImageTextCell")
        table.register(ReviewCollectionPinpliOnlyTextCell.self,
                       forCellReuseIdentifier: "ReviewCollectionPinpliOnlyTextCell")
        table.register(ReviewCollectionPinpliImageTextCell.self,
                       forCellReuseIdentifier: "ReviewCollectionPinpliImageTextCell")
        table.register(ReviewCollectionPinpliImageCell.self,
                       forCellReuseIdentifier: "ReviewCollectionPinpliImageCell")
        
        table.backgroundColor = .white
        return table
    }()
    
    var currentCategory:Int = 0
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addContentView()
        autoLayout()
    }
    
    private func addContentView(){
        addSubview(reviewTV)
    }
    
    private func autoLayout() {
        reviewTV.snp.makeConstraints { (make) in
            make.leading.top.trailing.bottom.equalToSuperview()
        }
    }
}

extension ReviewCollectionTableCell: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if currentCategory == 0 {
            let reviewCollectionTistoryOnlyTextCell: ReviewCollectionTistoryOnlyTextCell = tableView.dequeueReusableCell(withIdentifier: "ReviewCollectionTistoryOnlyTextCell") as! ReviewCollectionTistoryOnlyTextCell
            
            return reviewCollectionTistoryOnlyTextCell
        }else if currentCategory == 1 {
            let reviewCollectionYoutubeCell: ReviewCollectionYoutubeCell = tableView.dequeueReusableCell(withIdentifier: "ReviewCollectionYoutubeCell") as! ReviewCollectionYoutubeCell
            
            return reviewCollectionYoutubeCell
        }else if currentCategory == 2 {
            let reviewCollectionNaverImageTextCell: ReviewCollectionNaverImageTextCell = tableView.dequeueReusableCell(withIdentifier: "ReviewCollectionNaverImageTextCell") as! ReviewCollectionNaverImageTextCell
            
            return reviewCollectionNaverImageTextCell
        }else if currentCategory == 3 {
            let reviewCollectionTistoryOnlyTextCell: ReviewCollectionTistoryOnlyTextCell = tableView.dequeueReusableCell(withIdentifier: "ReviewCollectionTistoryOnlyTextCell") as! ReviewCollectionTistoryOnlyTextCell
            
            return reviewCollectionTistoryOnlyTextCell
        }else {
            let reviewCollectionPinpliImageCell: ReviewCollectionPinpliImageCell = tableView.dequeueReusableCell(withIdentifier: "ReviewCollectionPinpliImageCell") as! ReviewCollectionPinpliImageCell
            
            return reviewCollectionPinpliImageCell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}


