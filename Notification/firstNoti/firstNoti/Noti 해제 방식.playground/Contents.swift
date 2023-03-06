//import UIKit
//
//🥕 등록 - 해제 위치
//1)
//ViewDidLoad() - 등록
//deinit - 해제
//
//2)
//ViewWillAppear() - 등록
//ViewWillDisappear() - 해제
//
//🥕 해제 코드
//1) self에 등록된 옵저버 전체 제거
//NotificationCenter.default.removeObserver(self)
//
//2) 특정 옵저버 하나 제거
//NotificationCenter.default.removeObserver(self, name: NSNotification.Name(rawValue: "이벤트이름"), object: nil)
