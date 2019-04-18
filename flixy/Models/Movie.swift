//
//  Movie.swift
//  flixy
//
//  Created by Ryan Luu on 4/12/19.
//  Copyright © 2019 rnluu. All rights reserved.
//

import UIKit

class Movie {
    var id: Int
    var title: String
    var description: String
    var poster: String
    var backdrop: String
    
    init?(id: Int, title: String, description: String, poster: String, backdrop: String) {
        if title.isEmpty || description.isEmpty || poster.isEmpty || backdrop.isEmpty {
            return nil
        }
        self.id = id
        self.title = title
        self.description = description
        self.poster = poster
        self.backdrop = backdrop
    }
}
