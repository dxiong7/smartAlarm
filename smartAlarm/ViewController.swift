//
//  ViewController.swift
//  smartAlarm
//
//  Created by Daniel Xiong on 5/3/19.
//  Copyright © 2019 danielxiong523. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {
    @IBOutlet weak var web: WKWebView!
    var webView: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // 1
        /*let url = URL(string: "https://ioscreator.com")!
        webView.load(URLRequest(url: url))
        
        // 2
        let refresh = UIBarButtonItem(barButtonSystemItem: .refresh, target: webView, action: #selector(webView.reload))
        toolbarItems = [refresh]
        navigationController?.isToolbarHidden = false*/
        
    }

    /*override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
    }*/

    @IBAction func turnOn(_ sender: Any) {
        let url = NSURL(string: "http://192.168.43.185/LED=ON")
        let urlreq = NSURLRequest(url: url! as URL)
        print("on pressed")
        web.load(urlreq as URLRequest)
    }
    @IBAction func turnOff(_ sender: Any) {
        let url = NSURL(string: "http://192.168.43.185/LED=OFF")
        let urlreq = NSURLRequest(url: url! as URL)
        print("off pressed")
        web.load(urlreq as URLRequest)
    }
}

