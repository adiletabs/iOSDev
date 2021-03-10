//
//  WebsiteViewController.swift
//  Browser
//
//  Created by Adilet Absatov on 25.02.2021.
//

import UIKit
import WebKit

class WebsiteViewController: UIViewController, WKNavigationDelegate {
    private var webView: WKWebView!
    var browserModel: BrowserModel?
    
    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
        
        let tripleTapGesture = UITapGestureRecognizer(target: self, action: #selector(changeFavourite))
        tripleTapGesture.numberOfTapsRequired = 3
        view.addGestureRecognizer(tripleTapGesture)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let url = browserModel?.getCurrentLink() {
            webView.load(URLRequest(url: url))
            webView.allowsBackForwardNavigationGestures = true
        }
        if let colorYellow = browserModel?.getIsFavourite() {
            if colorYellow {
                self.navigationController?.navigationBar.barTintColor = UIColor.yellow
            }
        }
    }
    
    @objc func changeFavourite() {
        let title = self.navigationItem.title
        let added = browserModel?.handleFavourite(title!)
        if added! {
            self.navigationController?.navigationBar.barTintColor = UIColor.yellow
        } else {
            self.navigationController?.navigationBar.barTintColor = UIColor.white
        }
    }
}
