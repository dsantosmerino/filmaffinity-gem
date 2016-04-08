#FilmAffinity Scraper Gem

## Description

The filmaffinity gem allows you to easy access publicly available data from **Filmaffinity.com in spanish**.

## Features

- Search movies for a title
- Retrieve complete movie info
- Retrieve the Top 30 of filmaffinity.com
- Retrieve the Top with the given options

## Documentation

##### FilmAffinity::Search
Return an array of FilmAffinity::Movie, just containing preload ID and title.

##### FilmAffinity::Movie
Include some methods to retrieve the complete movie info.

##### FilmAffinity::Top options
The options hash could include:
```
{
  :genre => "AC",
  :country => "DE",
  :from_year => 2014,
  :to_year => 2016,
  :no_doc => true,
  :no_tv => true
}
  ```
##### :genre
- "AC"    Action
- "AV"    Adventure
- "AN"    Animation
- "CO"    Comedy
- "DO"    Documentary
- "DR"    Drama
- "FAN"   Fantasy
- "F-N"   Film-Noir
- "TE"    Horror
- "INF"   Kids
- "MU"    Musical
- "INT"   Mystery
- "RO"    Romance
- "C-F"   Sci-Fi
- "TH"    Thriller
- "TV_SE" TV Series
- "DESC"  Unknown
- "BE"    War
- "WE"    Western

##### :country
2-letter code supplied by the ISO

##### :no_doc
```true``` to avoid documentaries

##### :no_tv
```true``` to avoid TV series


## Examples

### Top:
    #Top FilmAffinity ever
    top = FilmAffinity::Top.new

    top.movies
    #=> [<FilmAffinity::Movie>
         <FilmAffinity::Movie>
         <FilmAffinity::Movie>
         ...]

    top.movies.first
    #=> #<FilmAffinity::Movie>

    #Top FilmAffinity with options
    options = {
      :genre => "AN",
      :no_tv => true
    }
    top = FilmAffinity::Top.new options

    top.movies
    #=> [<FilmAffinity::Movie>
         <FilmAffinity::Movie>
         <FilmAffinity::Movie>
         ...]

    top.movies.first
    #=> #<FilmAffinity::Movie>

### Search:

    search = FilmAffinity::Search.new("Padrino")

    search.movies
    #=> [<FilmAffinity::Movie>
         <FilmAffinity::Movie>
         <FilmAffinity::Movie>
         ...]

    search.movies.first
    #=> #<FilmAffinity::Movie>

### Movie:

    movie = FilmAffinity::Movie.new(809297, "El Padrino")

    movie.director
    #=> "Francis Ford Coppola"

    movie.year
    #=> 1972

    movie.rating
    #=> 9.1

    movie.cast
    #=> ["Marlon Brando",
         "Al Pacino",
         "James Caan",
         "Robert Duvall",
         "Diane Keaton",
         ...]

   movie.genres, movie.country, movie.sinopsis...


## Contributors

This gem is created and maintained by [Oriol Bellido](https://github.com/oricodes89) and [David Santos](https://github.com/davidsantosmerino)
