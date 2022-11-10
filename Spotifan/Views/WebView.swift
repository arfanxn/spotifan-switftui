//
//  WebView.swift
//  Spotifan
//
//  Created by Muhammad Arfan on 06/11/22.
//

import Foundation
import SwiftUI
import WebKit

struct WebView : UIViewRepresentable {
	let url : URL;
	
	func makeUIView(context: Context) -> some UIView {
		let webView = WKWebView()
		webView.navigationDelegate = context.coordinator
		let request = URLRequest(url: self.url)
		webView.load(request)
		return webView
	}
	
	func updateUIView(_ uiView: UIViewType, context: Context) {
		
	}
	
	func makeCoordinator() -> WebViewCoordinator {
		return WebViewCoordinator {
			
		} didFinish: {
			
		}
	}
}

class WebViewCoordinator : NSObject, WKNavigationDelegate {
	let didStart : () -> ()
	let didFinish : () -> ()
	
	init(didStart : @escaping () -> () = {},didFinish : @escaping () -> () = {}) {
		self.didStart = didStart
		self.didFinish = didFinish
	}
	
	func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
		self.didStart();
	}
	
	func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
		self.didFinish()
		print(webView.url ?? "Webview -> Error: Invalid URL");
	}

	
	func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
		print("Webview -> Error: \(error.localizedDescription)")
	}
}
