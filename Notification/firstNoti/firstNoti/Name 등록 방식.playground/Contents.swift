//import UIKit
//
//🍏 1) addObserver 할 때 한번에 하기
//
////Post
//NotificationCenter.default.post(name: Notification.Name("a"), object: nil)
////Add Observer
//NotificationCenter.default.addObserver(self, selector: #selector(printSomeThing(_:)), name: Notification.Name("a"), object: nil)
//
//🍎 2) Extension 으로 property 추가
//
//extension Notification.Name {
//    static let aa = Notification.Name("doItSomeThing")
//}
////Post
//NotificationCenter.default.post(name: Notification.Name.aa, object: nil)
//NotificationCenter.default.post(name: .aa, object: nil)
////Add Observer
//NotificationCenter.default.addObserver(self, selector: #selector(printSomeThing(_:)), name: Notification.Name.aa, object: nil)
//NotificationCenter.default.addObserver(self, selector: #selector(printSomeThing(_:)), name: .aa, object: nil)
//
//extension ViewController {
//    static let aaa = Notification.Name("doItSomeThing")
//}
////Post
//NotificationCenter.default.post(name: ViewController.aaa, object: nil)
////Add Observer
//NotificationCenter.default.addObserver(self, selector: #selector(printSomeThing(_:)), name: ViewController.aaa, object: nil)
