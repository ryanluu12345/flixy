//
//  Movie.swift
//  flixy
//
//  Created by Ryan Luu on 4/12/19.
//  Copyright © 2019 rnluu. All rights reserved.
//

import UIKit

class Movie {
    var title: String
    var description: String
    var poster: String
    
    init?(title: String, description: String, poster: String) {
        if title.isEmpty || description.isEmpty || poster.isEmpty {
            return nil
        }
        self.title = title
        self.description = description
        self.poster = poster
    }
}
