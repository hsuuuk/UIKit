//
//  ViewController.swift
//  htmlPractice
//
//  Created by 심현석 on 2023/02/20.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let webView = WKWebView(frame: view.frame)
        view.addSubview(webView)
        webView.navigationDelegate = self
        
        if let htmlPath = Bundle.main.path(forResource: "개인정보처리방침", ofType: "html") {
            let url = URL(fileURLWithPath: htmlPath)
            let request = URLRequest(url: url)
            webView.load(request)
        } else {
            print("fail")
        }
    }
}

