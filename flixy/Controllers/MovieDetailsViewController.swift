//
//  MovieDetailsViewController.swift
//  flixy
//
//  Created by Ryan Luu on 4/16/19.
//  Copyright © 2019 rnluu. All rights reserved.
//

import UIKit

class MovieDetailsViewController: UIViewController {

    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var movie: Movie?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = movie?.title
        descriptionLabel.text = movie?.description
        posterImageView.af_setImage(withURL: URL(string: (movie?.poster)!)!)
        backgroundImageView.af_setImage(withURL: URL(string: (movie?.backdrop)!)!)
    }
}
