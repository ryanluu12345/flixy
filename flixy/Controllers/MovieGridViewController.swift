//
//  MovieGridViewController.swift
//  flixy
//
//  Created by Ryan Luu on 4/16/19.
//  Copyright © 2019 rnluu. All rights reserved.
//

import UIKit

class MovieGridViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var movieCollectionView: UICollectionView!
    
    var moviesList: [Movie] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        movieCollectionView.delegate = self
        movieCollectionView.dataSource = self
        setupFlowLayout()
        getSuperheroMovies()
    }
    
    /**
        Method that setups the flow layout for the collection view
    **/
    func setupFlowLayout() {
        let numberPerRow = CGFloat(3.0)
        let view = self.view
        let layout = movieCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.minimumLineSpacing = 4
        layout.minimumInteritemSpacing = 4
        
        let width = (view!.frame.size.width - layout.minimumInteritemSpacing * (numberPerRow - 1)) / numberPerRow
        layout.itemSize = CGSize(width: width, height: width * 4/3)
    }
    
    /**
        Method that gets all superhero movies and then maps them to the movie list
    **/
    func getSuperheroMovies() {
        API().getSuperheroMovies(){(movies: [[String:Any]]?) in
            self.mapToModel(movies: movies)
            self.movieCollectionView.reloadData()
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
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return moviesList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = movieCollectionView.dequeueReusableCell(withReuseIdentifier: "movieGridCell", for: indexPath) as! MovieGridCell
        cell.movieImageView.af_setImage(withURL: URL(string: moviesList[indexPath.row].poster)!)
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let cell = sender as! MovieGridCell
        let indexPath = movieCollectionView.indexPath(for: cell)!
        let movie = moviesList[indexPath.item]
        let detailsViewController = segue.destination as! MovieDetailsViewController
        detailsViewController.movie = movie
        movieCollectionView.deselectItem(at: indexPath, animated: true)
    }
}
