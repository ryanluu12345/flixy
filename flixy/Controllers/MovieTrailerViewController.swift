//
//  MovieTrailerViewController.swift
//  flixy
//
//  Created by Ryan Luu on 4/17/19.
//  Copyright © 2019 rnluu. All rights reserved.
//

import UIKit
import WebKit

class MovieTrailerViewController: UIViewController, WKUIDelegate {
    
    @IBOutlet weak var webView: WKWebView!
    
    var movie:Movie?
    var movieTrailerLink: String = "https://www.youtube.com/"
    
    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getMovieTrailer()
    }
    
    func getMovieTrailer() {
        API().getMovieTrailer(id: (movie?.id)!){(trailers: [[String:Any]]?) in
            let trailer = trailers![0]
            let trailerKey = trailer["key"]
            self.movieTrailerLink = "https://www.youtube.com/watch?v=\(trailerKey ?? "")"
            
            let trailerURL = URL(string: self.movieTrailerLink)
            let trailerRequest = URLRequest(url: trailerURL!)
            self.webView.load(trailerRequest)
        }
    }
    
    @IBAction func onExitTap(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
