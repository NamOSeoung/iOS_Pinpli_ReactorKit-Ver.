//
//  SearchView.swift
//  Pinpli
//
//  Created by 남오승 on 2020/12/25.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa
import MapKit
import CoreLocation

class SearchView: BaseView {
    var areaFirstSelected:Int = 0 {
        didSet {
            areaLeftTV.reloadData()
        }
    }
    
    var areaSecondSelected:Int = 0 {
        didSet {
            areaRightTV.reloadData()
        }
    }
    
    var areaFirstList:[CommonAreaModel] = [] {
        didSet {
            areaLeftTV.reloadData()
        }
    }
    
    var areaSecondList:[CommonAreaModel] = [] {
        didSet {
            areaRightTV.reloadData()
        }
    }
    
    //장소 검색 기준데이터
    var areaSearchDataList:[String] = []
    
    //장소 검색 키워드로 검색 한 리스트
    var areaSearchList:[String] = [] {
        didSet {
            areaSearchTV.reloadData()
        }
    }
    
    var areaFirstCode:BehaviorRelay<String> = BehaviorRelay.init(value: String())
    var areaFirstName:String = "서울"
    var areaSecondName:BehaviorRelay<String> = BehaviorRelay.init(value: String())
    var tableCtrl:BehaviorRelay<Bool> = BehaviorRelay.init(value: Bool())
    var locationDenined:BehaviorRelay<Bool> = BehaviorRelay.init(value: false) //현재 위치 권한체크
    var currentLocation:BehaviorRelay<(x:Double, y:Double)?> = BehaviorRelay.init(value: nil) //현재 좌표
    var searchKeywordMoveEvent:BehaviorRelay<Bool> = BehaviorRelay.init(value: false)
    var disposeBag = DisposeBag()
    
    //검색 바 감싸는 뷰
    lazy var searchWrap: UIView = {
        let view = UIView()
        return view
    }()
    
    lazy var shopImageWrap: UIView = {
        let view = UIView()
        return view
    }()
    
    //검색 텍스트뷰
    lazy var searchKeywordTF: UITextField = {
        let text = UITextField()
        text.colorSetting(r: 0, g: 0, b: 0, alpha: 1)
        text.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 16)
        text.textAlignment = .center
        return text
    }()
    
    //키워드 지우는 버튼 감싸는 뷰
    lazy var keywordClearWrap: UIView = {
        let view = UIView()
        view.isHidden = true
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(keywordDeleteEvent(_:))))
        return view
    }()
    
    lazy var clearImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "clear_keyword")
        return image
    }()
    
    lazy var shopImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "shop")
        image.isUserInteractionEnabled = true
        image.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(searchKeywordMove(_:))))
        return image
    }()
    
    lazy var keywordWrap: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    lazy var keywordIsEmptyImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "keyword_is_empty")
        return image
    }()
    
    lazy var keywordBorderBottom: UIView = {
        let view = UIView()
        view.setBackgroundColor(r: 222, g: 222, b: 222, alpha: 1)
        return view
    }()
    
    //현 위치 주소로 검색하기 감싸는 뷰
    lazy var currentLocationWrap: UIView = {
        let view = UIView()
        
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(currentLocationEvent(_:))))
        return view
    }()
    
    lazy var currentLocationContentsWrap: UIView = {
        let view = UIView()
        return view
    }()
    
    lazy var currentLocationImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "location")
        return image
    }()
    
    lazy var currentLocationBottomBorder:UIView = {
        let view = UIView()
        view.setBackgroundColor(r: 222, g: 222, b: 222, alpha: 1)
        return view
    }()
    
    //현 위치 주소로 검색하기
    lazy var currentLocationGL: UILabel = {
        let label = UILabel()
        label.text = "현 위치 주소로 검색하기"
        label.colorSetting(r: 51, g: 51, b: 51, alpha: 1)
        label.font = UIFont(name: "AppleSDGothicNeo-SemiBold", size: 16)
        label.textAlignment = .left
        return label
    }()
    
    lazy var areaContentsWrap: UIView = {
        let view = UIView()
        return view
    }()
    
    lazy var areaLeftWrap: UIView = {
        let view = UIView()
        return view
    }()
    
    lazy var areaGubunLine: UIView = {
        let view = UIView()
        view.backgroundColor = colorSetting(r: 222, g: 222, b: 222, alpha: 1)
        return view
    }()
    
    lazy var areaRightWrap: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        return view
    }()
    
    lazy var areaLeftTV: UITableView = {
        let table = UITableView()
        table.dataSource = self
        table.delegate = self
        table.keyboardDismissMode = .onDrag
        table.showsHorizontalScrollIndicator = false
        table.showsVerticalScrollIndicator = false
        table.register(AreaFirstCell.self,
                       forCellReuseIdentifier: "AreaFirstCell")
        return table
    }()
    
    lazy var areaRightTV: UITableView = {
        let table = UITableView()
        table.dataSource = self
        table.delegate = self
        table.keyboardDismissMode = .onDrag
        table.showsHorizontalScrollIndicator = false
        table.showsVerticalScrollIndicator = false
        table.register(AreaSecondCell.self,
                       forCellReuseIdentifier: "AreaSecondCell")
        return table
    }()
    
    lazy var areaSearchTV: UITableView = {
        let table = UITableView()
        table.dataSource = self
        table.delegate = self
        table.keyboardDismissMode = .onDrag
        table.showsHorizontalScrollIndicator = false
        table.showsVerticalScrollIndicator = false
        table.register(AreaSecondCell.self,
                       forCellReuseIdentifier: "AreaSecondCell")
        return table
    }()
    
    let locationManager = CLLocationManager()
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        
        /* Rx Event */
        searchKeywordTF
            .rx
            .controlEvent(.editingDidBegin) //textField Focus
            .bind{ [weak self] _ in
                self?.keywordIsEmptyImage.isHidden = true
            }.disposed(by: disposeBag)
        
        searchKeywordTF
            .rx
            .controlEvent(.editingDidEnd) //textField Focus Out
            .bind{ [weak self] _ in
                self?.keywordIsEmptyImage.isHidden = false
            }.disposed(by: disposeBag)
        
        tableCtrl
            .bind(to: areaSearchTV.rx.isHidden,
                  keywordClearWrap.rx.isHidden)
            .disposed(by: disposeBag)
        
        searchKeywordTF.rx.text.orEmpty.asDriver()
            .drive(onNext:{ [weak self] result in
                self?.areaSearchEvent()
            }).disposed(by: disposeBag)
        
        /* */
        
        addContentView()
        autoLayout()
    }
    
    private func addContentView() {
        addSubview(searchWrap)
        searchWrap.addSubview(shopImageWrap)
        shopImageWrap.addSubview(shopImage)
        searchWrap.addSubview(keywordWrap)
        searchWrap.addSubview(keywordClearWrap)
        keywordClearWrap.addSubview(clearImage)
        keywordWrap.addSubview(keywordIsEmptyImage)
        keywordWrap.addSubview(searchKeywordTF)
        addSubview(keywordBorderBottom)
        addSubview(currentLocationWrap)
        currentLocationWrap.addSubview(currentLocationContentsWrap)
        currentLocationContentsWrap.addSubview(currentLocationImage)
        currentLocationContentsWrap.addSubview(currentLocationGL)
        addSubview(currentLocationBottomBorder)
        addSubview(areaContentsWrap)
        areaContentsWrap.addSubview(areaLeftWrap)
        areaLeftWrap.addSubview(areaLeftTV)
        areaContentsWrap.addSubview(areaGubunLine)
        areaContentsWrap.addSubview(areaRightWrap)
        addSubview(areaSearchTV)
        areaRightWrap.addSubview(areaRightTV)
    }
    
    private func autoLayout() {
        searchWrap.snp.makeConstraints{ make in
            let height = aspectRatio(standardSize: 40)
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(0)
            make.width.equalTo(snp.width)
            make.height.equalTo(height)
        }
        
        shopImageWrap.snp.makeConstraints{ make in
            let width = aspectRatio(standardSize: 60)
            make.leading.equalTo(0)
            make.height.equalTo(searchWrap.snp.height)
            make.width.equalTo(width)
        }
        
        shopImage.snp.makeConstraints{ make in
            make.top.equalTo(shopImageWrap.snp.top).offset(4)
            make.leading.equalTo(shopImageWrap.snp.leading).offset(22)
            make.trailing.equalTo(shopImageWrap.snp.trailing).offset(-14)
            make.bottom.equalTo(shopImageWrap.snp.bottom).offset(-12)
        }
        
        keywordClearWrap.snp.makeConstraints{ make in
            let width = aspectRatio(standardSize: 60)
            make.trailing.equalTo(0)
            make.height.equalTo(searchWrap.snp.height)
            make.width.equalTo(width)
        }
        
        clearImage.snp.makeConstraints{ make in
            let width = aspectRatio(standardSize: 14)
            make.width.height.equalTo(width)
            make.top.equalTo(9)
            make.leading.equalTo(19)
        }
        
        keywordWrap.snp.makeConstraints{ make in
            make.top.bottom.equalTo(0)
            make.leading.equalTo(shopImageWrap.snp.trailing).offset(0)
            make.trailing.equalTo(keywordClearWrap.snp.leading).offset(0)
        }
        
        keywordIsEmptyImage.snp.makeConstraints{ make in
            make.top.equalTo(12)
            make.leading.equalTo(15)
            make.trailing.equalTo(-76)
            make.height.equalTo(18)
        }
        
        searchKeywordTF.snp.makeConstraints{ make in
            make.top.bottom.leading.trailing.equalTo(0)
        }
        
        keywordBorderBottom.snp.makeConstraints{ make in
            make.top.equalTo(searchWrap.snp.bottom).offset(3)
            make.height.equalTo(0.5)
            make.width.equalTo(snp.width)
        }
        
        currentLocationWrap.snp.makeConstraints{ make in
            let height = aspectRatio(standardSize: 52)
            make.top.equalTo(keywordBorderBottom.snp.bottom)
            make.height.equalTo(height)
            make.width.equalTo(snp.width)
        }
        
        currentLocationContentsWrap.snp.makeConstraints{ make in
            let width = aspectRatio(standardSize: 190)
            make.width.equalTo(width)
            make.height.equalTo(currentLocationWrap)
            make.centerX.equalTo(currentLocationWrap)
        }
        
        currentLocationImage.snp.makeConstraints{ make in
            let height = aspectRatio(standardSize: 20)
            make.width.height.equalTo(height)
            make.centerY.equalTo(currentLocationContentsWrap)
            make.leading.equalTo(0)
        }
        
        currentLocationGL.snp.makeConstraints{ make in
            let fontSize = aspectRatio(standardSize: 16)
            currentLocationGL.font = currentLocationGL.font.withSize(fontSize)
            make.leading.equalTo(currentLocationImage.snp.trailing).offset(8)
            make.trailing.equalTo(0)
            make.centerY.equalTo(currentLocationContentsWrap)
        }
        
        currentLocationBottomBorder.snp.makeConstraints{ make in
            make.top.equalTo(currentLocationWrap.snp.bottom).offset(0)
            make.width.equalTo(snp.width)
            make.height.equalTo(0.5)
        }
        
        areaContentsWrap.snp.makeConstraints{ make in
            make.top.equalTo(currentLocationBottomBorder.snp.bottom).offset(0)
            make.width.equalTo(snp.width)
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom)
        }
        
        areaSearchTV.snp.makeConstraints{ make in
            make.top.equalTo(keywordBorderBottom.snp.bottom).offset(5)
            make.leading.bottom.trailing.equalTo(safeAreaLayoutGuide)
        }
        
        areaLeftWrap.snp.makeConstraints{ make in
            let width = aspectRatio(standardSize: 100)
            make.top.leading.bottom.equalTo(0)
            make.width.equalTo(width)
        }
        
        areaLeftTV.snp.makeConstraints{ make in
            make.top.leading.trailing.bottom.equalTo(0)
        }
        
        areaGubunLine.snp.makeConstraints{ make in
            make.top.bottom.equalTo(0)
            make.leading.equalTo(areaLeftWrap.snp.trailing)
            make.width.equalTo(0.5)
        }
        
        areaRightWrap.snp.makeConstraints{ make in
            make.top.right.bottom.equalTo(0)
            make.leading.equalTo(areaGubunLine.snp.trailing)
        }
        
        areaRightTV.snp.makeConstraints{ make in
            make.top.leading.trailing.bottom.equalTo(0)
        }
    }
    
    //키워드 작성 시 이벤트
    func areaSearchEvent() {
        let keywordCnt:Int = searchKeywordTF.text?.count ?? 0
        let keyword:String = searchKeywordTF.text!
        if keywordCnt > 0 {
            tableCtrl.accept(false)
        }else {
            tableCtrl.accept(true)
        }
        areaSearchList.removeAll()
        
        for area in areaSearchDataList {
            if area.contains(keyword) {
                areaSearchList.append(area)
            }
        }
    }
    
    @objc func currentLocationEvent(_ gesture:UITapGestureRecognizer) {
        //        print(2222)
        
        gesture.view?.showAnimation { [weak self] in
            self?.requestGPSPermission()
//            self?.locationManager.requestWhenInUseAuthorization()
            
            /* 위치정보를 자동업데이트를 하기위해서 필요한 부분
             
             if CLLocationManager.locationServicesEnabled() {
             locationManager.delegate = self
             locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
             locationManager.startUpdatingLocation()
             }
             */
            
            //수동 위치정보 호출
//            guard let locValue: CLLocationCoordinate2D = self?.locationManager.location?.coordinate else { return }
//            print(locValue)
            //            getLocationToAddressKakao(callingView: self as Any, longitude: locValue.longitude, latitude: locValue.latitude)
        }
    }
    
    @objc func keywordDeleteEvent(_ gesture:UITapGestureRecognizer) {
        searchKeywordTF.text = ""
        areaSearchList.removeAll()
        tableCtrl.accept(true)
    }
    
    @objc func searchKeywordMove(_ gesture:UITapGestureRecognizer) {
        searchKeywordMoveEvent.accept(true)
    }
    
    //gps 퍼미션 체크
    func requestGPSPermission(){
        
        switch CLLocationManager.authorizationStatus() {
        case .authorizedAlways, .authorizedWhenInUse:
            guard let locationValue: CLLocationCoordinate2D = locationManager.location?.coordinate else { return }
            let location = (locationValue.longitude, locationValue.latitude)
            currentLocation.accept(location)
        case .restricted, .notDetermined:
            locationManager.requestWhenInUseAuthorization()
            guard let locationValue: CLLocationCoordinate2D = locationManager.location?.coordinate else { return }
            let location = (locationValue.longitude, locationValue.latitude)
            currentLocation.accept(location)
        case .denied:
            locationDenined.accept(true)
        default:
            break
        }
    }
}

extension SearchView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == areaLeftTV {
            return areaFirstList.count
        }else if tableView == areaRightTV {
            return areaSecondList.count
        }else {
            return areaSearchList.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == areaLeftTV {
            let areaFirstCell: AreaFirstCell = tableView.dequeueReusableCell(withIdentifier: "AreaFirstCell") as! AreaFirstCell
            
            areaFirstCell.areaNameGL.text = areaFirstList[indexPath.row].areaName
            
            if areaFirstSelected == indexPath.row {
                areaFirstCell.borderRight.isHidden = false
                areaFirstCell.areaNameGL.colorSetting(r: 51, g: 51, b: 51, alpha: 1)
            }else {
                areaFirstCell.borderRight.isHidden = true
                areaFirstCell.areaNameGL.colorSetting(r: 189, g: 189, b: 189, alpha: 1)
            }
            
            return areaFirstCell
        }else if tableView == areaRightTV{
            let areaSecondCell: AreaSecondCell = tableView.dequeueReusableCell(withIdentifier: "AreaSecondCell") as! AreaSecondCell
            
            areaSecondCell.areaNameGL.text = areaSecondList[indexPath.row].areaName
            
            return areaSecondCell
        }else {
            let areaSecondCell: AreaSecondCell = tableView.dequeueReusableCell(withIdentifier: "AreaSecondCell") as! AreaSecondCell
            
            areaSecondCell.areaNameGL.text = areaSearchList[indexPath.row]
            
            return areaSecondCell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView == areaLeftTV {
            areaFirstName = areaFirstList[indexPath.row].areaName
            areaFirstSelected = indexPath.row
            areaFirstCode.accept(areaFirstList[indexPath.row].area)
        }else if tableView == areaRightTV {
            areaSecondSelected = indexPath.row
            if indexPath.row == 0 {
                areaSecondName.accept(areaFirstName)
            }else {
                areaSecondName.accept(areaFirstName + " " + areaSecondList[indexPath.row].areaName)
            }
        }else {
            areaSecondName.accept(areaSearchList[indexPath.row])
        }
    }
}
