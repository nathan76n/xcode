//
//  DetailViewController.swift
//  JSON
//
//  Created by Nguyen, Nathan on 11/30/15.
//  Copyright (c) 2015 nigmia. All rights reserved.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {
    var webView: WKWebView!
    var detailItem: [String: String]!

    override func loadView() {
        webView = WKWebView()
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        println(detailItem)
        if detailItem != nil {} else { return }
        if let title = detailItem["title"] {
            self.title = title
        }
        if let body = detailItem["content"] {
            var html = "<html>"
            html += "<head>"
            html += "<meta name=\"viewport\" content=\"width=device-width, initial-scale=.8\">"
            html += "<style> body { font-size: 120%;} </style>"
            html += "<link rel=\"stylesheet\" href=\"http://www.blog.invesco.us.com/wp-content/themes/Minimal/style.css\" type=\"text/css\" media=\"screen\">"
            html += "</head>"
            html += "<body>"
            html += body
            html += "</body>"
            html += "</html>"
            webView.loadHTMLString(html, baseURL: nil)
        }
    }
}

