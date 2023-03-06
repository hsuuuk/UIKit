import UIKit

extension Notification.Name {
    static let secret = Notification.Name("Shh")
}

enum NotificationKey {
    case password
}

class Master {
    func callPassword() {
        print("마스터: 벽면에 쓰여있는 암호를 읊어봐.")
        
        NotificationCenter.default.post(name: Notification.Name.secret, object: nil, userInfo: [NotificationKey.password: "!@#$"])
    }
}

class Friend {
    let name: String
    
    init(name: String) {
        self.name = name
        
        NotificationCenter.default.addObserver(self, selector: #selector(answerToMaster(notification:)), name: Notification.Name.secret, object: nil)
    }
    @objc func answerToMaster(notification: Notification) {
        
        guard let object = notification.userInfo?[NotificationKey.password] as? String else { return }
        print("\(name): 암호는 \(object)")
    }
}

let master = Master()

let ariOwn = Friend(name: "아리랑")
let ariTwo = Friend(name: "쓰리랑")
let ariThree = Friend(name: "아라리오")

master.callPassword()
