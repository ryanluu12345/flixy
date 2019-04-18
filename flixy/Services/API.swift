//
//  API.swift
//  flixy
//
//  Created by Ryan Luu on 4/12/19.
//  Copyright © 2019 rnluu. All rights reserved.
//

import Foundation

class API {
    // Gets the posts json data and returns it converted as a dictionary
    func getPosts(completion: @escaping ([[String: Any]]?) -> Void) {
        // Network request snippet
        let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed")!
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        session.configuration.requestCachePolicy = .reloadIgnoringLocalCacheData
        let task = session.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print(error.localizedDescription)
            } else if let data = data,
                let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                
                var movies: [[String: Any]] = []
                // Get the movies and return them
                movies = dataDictionary["results"] as! [[String: Any]]
                
                return completion(movies)
            }
        }
        task.resume()
    }
    
    func getSuperheroMovies(completion: @escaping ([[String: Any]]?) -> Void) {
        // Network request snippet
        let url = URL(string: "https://api.themoviedb.org/3/movie/287947/similar?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed")!
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        session.configuration.requestCachePolicy = .reloadIgnoringLocalCacheData
        let task = session.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print(error.localizedDescription)
            } else if let data = data,
                let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                
                var movies: [[String: Any]] = []
                // Get the movies and return them
                movies = dataDictionary["results"] as! [[String: Any]]
                
                return completion(movies)
            }
        }
        task.resume()
    }
    
    func getMovieTrailer(id: Int, completion: @escaping ([[String: Any]]?) -> Void) {
        // Network request snippet
        let url = URL(string: "https://api.themoviedb.org/3/movie/\(String(id))/videos?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed&language=en-US")!
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        session.configuration.requestCachePolicy = .reloadIgnoringLocalCacheData
        let task = session.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print(error.localizedDescription)
            } else if let data = data,
                let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                
                var movies: [[String: Any]] = []
                // Get the movies and return them
                movies = dataDictionary["results"] as! [[String: Any]]
                
                return completion(movies)
            }
        }
        task.resume()
    }
}
