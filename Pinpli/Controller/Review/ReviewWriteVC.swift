//
//  ReviewWriteVC.swift
//  Pinpli
//
//  Created by 남오승 on 2021/01/12.
//

import UIKit
import Photos
import TLPhotoPicker
import Mantis

//리뷰 작성
class ReviewWriteVC: BaseViewController {
    let reviewWriteView = ReviewWriteView()
    var selectedAssets = [TLPHAsset]()
    var image:UIImage?
    var croppedImage:UIImage?
    var imageManager = PHCachingImageManager() //앨범에서 사진 받아오기 위한 객체
    
    override func viewDidLoad() {
        view = reviewWriteView
        
        /* UIEvent */
        let backEvent = reviewWriteView.backEvent.filter{$0}
        let imageSelectEvent = reviewWriteView.imageSelectEvent.filter{$0}
        backEvent.bind{[weak self] result in
            self?.dismiss(animated: true, completion: nil)
        }.disposed(by: disposeBag)
        
        imageSelectEvent.bind{[weak self] result in
            self?.albumCallEvent()
        }.disposed(by: disposeBag)
        /* */
    }
    
    func albumCallEvent() {
        let optionMenu = UIAlertController(title: .none, message: .none, preferredStyle: .actionSheet)
        
        print(PHAuthorizationStatus.authorized)
        let albumAction = UIAlertAction(title: "앨범에서 사진 가져오기", style: .default, handler:
        {
            
            [weak self] (alert: UIAlertAction!) -> Void in
            self?.albumMoveEvent()
            PHPhotoLibrary.requestAuthorization({ (granted) in
                if (granted == PHAuthorizationStatus.authorized) { //접근 허용
                    DispatchQueue.main.async {
//                        guard let photoMultiImagePOP = albumStoryBoard.instantiateViewController(withIdentifier: "PhotoMultiImagePOP") as? PhotoMultiImagePOP else {
//                            return
//                        }
//                            self.selectedPhotoImage.reverse()
//                            self.selectedPhotoMediaId.reverse()
//                        photoMultiImagePOP.selectedPhotoImage = self.selectedPhotoImage
//                        photoMultiImagePOP.callingView = self as Any
//                        photoMultiImagePOP.selectedMediaId = self.selectedPhotoMediaId
//                            photoMultiImagePOP.updateSelectedPhotoImage = self.updateSelectedPhotoImage
//                        photoMultiImagePOP.updateUrlList = self.updateUrlList
//                        photoMultiImagePOP.updateAlbumList = self.updateAlbumList
//                        self.present(photoMultiImagePOP, animated: true, completion: nil)
                    }
                } else {
                  DispatchQueue.main.async {
                        let alert = UIAlertController(title: "'설정 > Rippler > 앨범 권한 ON'\n앨범 접근 권한을 켜주세요 :)", message: "\n앨범 권한 허용해야 사진을 등록 할 수 있어요😝권한 설정하러 가볼까요~?", preferredStyle: .alert)
                                             // Change font and color of title

                        alert.setValue(NSAttributedString(string: alert.title!, attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.semibold), NSAttributedString.Key.foregroundColor : UIColor.black]), forKey: "attributedTitle")

                        alert.setValue(NSAttributedString(string: alert.message!, attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 13,weight: UIFont.Weight.regular),NSAttributedString.Key.foregroundColor :UIColor.black]), forKey: "attributedMessage")

                        let subview = (alert.view.subviews.first?.subviews.first?.subviews.first!)! as UIView

                        alert.addAction(UIAlertAction(title: "확인", style: .cancel, handler: { (action:UIAlertAction!) in
                            if let settingUrl = URL(string:UIApplication.openSettingsURLString) {
                                           UIApplication.shared.open(settingUrl)
                            } else {
                                print("Setting URL invalid")
                            }
                        }))

                        subview.backgroundColor = UIColor.white

                    self?.present(alert, animated: true)
                    }

                    // Doing
                }
            })

        })

        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler:
        {
            (alert: UIAlertAction!) -> Void in
        })
   
        optionMenu.addAction(albumAction)
        optionMenu.addAction(cancelAction)
        
        present(optionMenu, animated: true, completion: nil)

    }
    
    //엘범 호출하는 이벤트
    func albumMoveEvent() {
        let albumStatus = PHPhotoLibrary.authorizationStatus()
        let cameraStatus = AVCaptureDevice.authorizationStatus(for: AVMediaType.video);

        if cameraStatus == .authorized {
            print("카메라 인증")
        }
        
        if albumStatus == .authorized {
            print("앨범 인증")
        }
        if cameraStatus == .authorized {// 권한 설정이 되었을 때 처리
            if albumStatus == .authorized { // 권한 설정이 되었을 때 처리
                photoMove()
            } else if albumStatus == .denied  { // 권한 설정이 거부 되었을 때
                accessDeniedAlert(flag: true)
            } else if albumStatus == .notDetermined {
                // 결정 안됨 (아래와 같이 시스템 팝업 띄움)
                PHPhotoLibrary.requestAuthorization({ [weak self] (result:PHAuthorizationStatus) in
                    switch result{
                    case .authorized: // 권한 설정이 되었을 때 처리
                        DispatchQueue.main.async {
                            self?.photoMove()
                        }
                        break
                    case .denied: // 권한 설정이 거부 되었을 때
                        DispatchQueue.main.async {
                            self?.accessDeniedAlert(flag: true)
                        }
                        break
                    default:
                        break
                    }
                })
            }
        } else if cameraStatus == .denied {// 권한 설정이 거부 되었을 때
            accessDeniedAlert(flag: false)
        }else if cameraStatus == .notDetermined { //초기 물음
            // 결정 안됨 (아래와 같이 시스템 알럿 띄움)
            AVCaptureDevice.requestAccess(for: AVMediaType.video) { [weak self] response in
                if response { // 권한 설정이 되었을 때 처리
                    if albumStatus == .authorized { // 권한 설정이 되었을 때 처리
                        self?.photoMove()
                    } else if albumStatus == .denied  { // 권한 설정이 거부 되었을 때
                        self?.accessDeniedAlert(flag: true)
                    } else if albumStatus == .notDetermined {
                        // 결정 안됨 (아래와 같이 시스템 팝업 띄움)
                        PHPhotoLibrary.requestAuthorization({ [weak self] (result:PHAuthorizationStatus) in
                            switch result{
                            case .authorized: // 권한 설정이 되었을 때 처리
                                DispatchQueue.main.async {
                                    self?.photoMove()
                                }
                                break
                            case .denied: // 권한 설정이 거부 되었을 때
                                DispatchQueue.main.async {
                                    self?.accessDeniedAlert(flag: true)
                                }
                                break
                            default:
                                break
                            }
                        })
                    }
                } else { // 권한 설정이 거부 되었을 때
                    DispatchQueue.main.async {
                        self?.accessDeniedAlert(flag: false)
                    }
                }
            }
        }
    }
    
    //앨범 + 카메라 접근
    func photoMove() {
        let viewController = TLPhotosPickerViewController()
        viewController.delegate = self
        var configure = TLPhotosPickerConfigure() //커스텀
        
        
        configure.cancelTitle = "취소"
        configure.doneTitle = "완료"
        configure.emptyMessage = "앨범이 없습니다."
        configure.allowedVideo = false
        configure.allowedVideoRecording = false
        configure.allowedLivePhotos = false
        configure.maxSelectedAssets = 4 //4개까지 선택가능
        configure.singleSelectedMode = false //한개 선택모드 여부
        configure.tapHereToChange = "앨범 변경"
        configure.selectedColor = UIColor(red: 253/255, green: 177/255, blue: 75/255, alpha: 1.0)
        viewController.configure = configure
        
        present(viewController, animated: true, completion: nil)
    }
    
    func accessDeniedAlert(flag:Bool) {
        var alert = UIAlertController(title: "고객님의 원활한 '적셔' \n서비스 이용을 위해\n아래의 앨범 접근 권한 허용이 필요합니다.", message: "\n프로필 설정 시 이미지 첨부", preferredStyle: .alert)
        if !flag {
            alert = UIAlertController(title: "고객님의 원활한 '적셔' \n서비스 이용을 위해\n아래의 카메라 접근 권한 허용이 필요합니다.", message: "\n프로필 설정 시 이미지 첨부", preferredStyle: .alert)
        }
        
        // Change font and color of title
        
        alert.setValue(NSAttributedString(string: alert.title!, attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.semibold), NSAttributedString.Key.foregroundColor : UIColor.black]), forKey: "attributedTitle")
        
        alert.setValue(NSAttributedString(string: alert.message!, attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 13,weight: UIFont.Weight.regular),NSAttributedString.Key.foregroundColor :UIColor.black]), forKey: "attributedMessage")
        
        let subview = (alert.view.subviews.first?.subviews.first?.subviews.first!)! as UIView
        
        alert.addAction(UIAlertAction(title: "확인", style: .cancel, handler: { (action:UIAlertAction!) in
            if let settingUrl = URL(string:UIApplication.openSettingsURLString) {
                UIApplication.shared.open(settingUrl)
            } else {
                print("Setting URL invalid")
            }
        }))
        
        subview.backgroundColor = UIColor.white
        
      
    }
}

extension ReviewWriteVC: TLPhotosPickerViewControllerDelegate {
    
    //TLPhotosPickerViewControllerDelegate
    func shouldDismissPhotoPicker(withTLPHAssets: [TLPHAsset]) -> Bool {
        // use selected order, fullresolution image
        selectedAssets = withTLPHAssets
        return true
    }
    
    func photoPickerDidCancel() {
        // cancel
    }
    
    func dismissComplete() {
        // picker viewcontroller dismiss completion
    }
    
    func canSelectAsset(phAsset: PHAsset) -> Bool {
        //Custom Rules & Display
        //You can decide in which case the selection of the cell could be forbidden.
        return true
    }
    
    func didExceedMaximumNumberOfSelection(picker: TLPhotosPickerViewController) {
        // exceed max selection
    }
    
    func handleNoAlbumPermissions(picker: TLPhotosPickerViewController) {
        // handle denied albums permissions case
    }
    
    func handleNoCameraPermissions(picker: TLPhotosPickerViewController) {
        // handle denied camera permissions case
    }
}
