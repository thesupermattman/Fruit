//
//  FruitWebViewViewController.swift
//  Fruit
//
//  Created by arthithai.aamlid on 14/2/2566 BE.
//

import UIKit
import WebKit
import Foundation

class FruitWebViewViewController: UIViewController {
    
    @IBOutlet weak var webView: WKWebView!
    
    var urlString: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadWebpage()
    }
    
    func loadWebpage() {
        
        guard let notNilUrlString = urlString else { return }
        let url = URL(string: notNilUrlString)
        webView.load(URLRequest.init(url: url!))
    }
}

//        let url = URL(string: "https://en.wikipedia.org/wiki/Apple")
//        webView.load(URLRequest.init(url: url!))
