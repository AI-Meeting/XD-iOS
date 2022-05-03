//
//  GetAddressViewController.swift
//  XD
//
//  Created by 장서영 on 2022/04/11.
//

import UIKit
import WebKit
import SnapKit
import Then

class GetAddressViewController: UIViewController {
    
    var webView: WKWebView?
    let indicator = UIActivityIndicatorView(style: .medium)
    var address = ""
    let contentController = WKUserContentController()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    // MARK: - UI
    private func configureUI() {
        view.backgroundColor = .white
        setAttributes()
        setContraints()
    }
    
    private func setAttributes() {
        let contentController = WKUserContentController()
        contentController.add(self, name: "callBackHandler")
        
        let configuration = WKWebViewConfiguration()
        configuration.userContentController = contentController
        
        webView = WKWebView(frame: .zero, configuration: configuration)
        self.webView?.navigationDelegate = self
        
        guard let url = URL(string: "https://ai-meeting.github.io/XD-Address/"),
              let webView = webView
        else { return }
        let request = URLRequest(url: url)
        webView.load(request)
        indicator.startAnimating()
    }
    
    private func setContraints() {
        guard let webView = webView else { return }
        view.addSubview(webView)
        webView.translatesAutoresizingMaskIntoConstraints = false
        
        webView.addSubview(indicator)
        indicator.translatesAutoresizingMaskIntoConstraints = false
        
        webView.snp.makeConstraints {
            $0.top.bottom.leading.trailing.equalToSuperview()
        }
        
        indicator.snp.makeConstraints {
            $0.centerX.equalTo(webView.snp.centerX)
            $0.centerY.equalTo(webView.snp.centerY)
        }
    }
}

extension GetAddressViewController: WKScriptMessageHandler {
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        if let data = message.body as? [String: Any] {
            address = data["roadAddress"] as? String ?? ""
        }
        guard let previousVC = presentingViewController as? WriteReviewViewController else { return }
        previousVC.locationButton.setTitle("   \(address)", for: .normal)
        previousVC.locationButton.setTitleColor(.black, for: .normal)
        self.dismiss(animated: true, completion: nil)
    }
}

extension GetAddressViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        indicator.startAnimating()
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        indicator.stopAnimating()
    }
}
