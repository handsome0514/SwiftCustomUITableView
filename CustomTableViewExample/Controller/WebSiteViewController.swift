//
//  WebSiteViewController.swift
//  Soccer
//
//  Created by mac on 2/29/24.
//

import Foundation
import UIKit
import WebKit

class WebSiteViewController: UIViewController {
    
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var name: UILabel!
    override func viewDidLoad() {
        setBackgroundImage()
        name.text = ViewController.sectionData[Players.section].players[Players.selected].name
        backBtn.setTitle("", for: .normal)
        let url = URL (string: ViewController.sectionData[Players.section].players[Players.selected].website)
        let requestObj = URLRequest(url: url!)
        webView.load(requestObj)                
        webView.layer.cornerRadius = 20.0
        webView.layer.masksToBounds = true
    }
    @IBAction func back(_ sender: Any) {
        dismiss(animated: true)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        let url = URL (string: "about:blank")
        let requestObj = URLRequest(url: url!)
        webView.load(requestObj)
    }
    func setBackgroundImage() {
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "background.jpeg")
        backgroundImage.contentMode = .scaleAspectFill
        self.view.insertSubview(backgroundImage, at: 0)
    }
}
