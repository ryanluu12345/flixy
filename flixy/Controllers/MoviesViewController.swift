//
//  MoviesViewController.swift
//  flixy
//
//  Created by Ryan Luu on 4/12/19.
//  Copyright © 2019 rnluu. All rights reserved.
//

import UIKit
import AlamofireImage

class MoviesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var moviesList: [Movie] = []
    var stringList: [String] = ["yo", "yo", "ma"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        getMovies()
    }
    
    /**
     Method that gets all of the movies from the API
     **/
    func getMovies(){
        API().getPosts(){(movies: [[String:Any]]?) in
            self.mapToModel(movies: movies)
            self.tableView.reloadData()
        }
    }
    
    /**
     Method that maps the JSON dictionary into an array of Movie models
    **/
    func mapToModel(movies: [[String:Any]]?){
        let baseURL = "https://image.tmdb.org/t/p/w500/"
        
        //Guards movies so movies are only populated if the JSON is returned from HTTP
        if let movies = movies as? [[String:Any]] {
            for movie in movies {
                let id = movie["id"] as! Int
                let title = movie["title"] as! String
                let description = movie["overview"] as! String
                let poster = movie["poster_path"] as! String
                let backdrop = movie["backdrop_path"] as! String
                let movie = Movie.init(id: id, title: title, description: description, poster: baseURL + poster, backdrop: baseURL + backdrop)
                moviesList.append(movie!)
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return moviesList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell") as! MovieCell
        cell.titleLabel.text = moviesList[indexPath.row].title
        cell.descriptionLabel.text = moviesList[indexPath.row].description
        cell.posterImage.af_setImage(withURL: URL(string: moviesList[indexPath.row].poster)!)
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let cell = sender as! UITableViewCell
        let indexPath = tableView.indexPath(for: cell)!
        let movie = moviesList[indexPath.row]
        let detailsViewController = segue.destination as! MovieDetailsViewController
        detailsViewController.movie = movie
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
