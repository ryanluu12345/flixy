# flixy

flixy is an app that allows users to browse movies from the [The Movie Database API](http://docs.themoviedb.apiary.io/#).

## Flix Part 1

### User Stories

#### REQUIRED (10pts)
- [x] (2pts) User sees an app icon on the home screen and a styled launch screen.
- [x] (5pts) User can view and scroll through a list of movies now playing in theaters.
- [x] (3pts) User can view the movie poster image for each movie.

#### BONUS
- [x] (2pt) User can view the app on various device sizes and orientations.
- [ ] (1pt) Run your app on a real device.

### App Walkthough GIF
<img src="http://g.recordit.co/3NNCIG6JHb.gif" width=250><br>

### Notes
While building the application, I was getting an error related to the table view cell being nil. I spent nearly an hour debugging and realized that I forgot to set the identifier in two places. I only had it set on the same page as the class declaration.

Furthermore, I struggled to understand how to get the API data from the closure, but looking at the sample code from class with the escaping return value was very helpful.

Overall, I was able to learn a lot about HTTP requests for data and how to populate table views with the data.
