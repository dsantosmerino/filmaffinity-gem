#FilmAffinity Scraper Gem

## Description

The filmaffinity gem allows you to easy access publicly available data from Filmaffinity.com in spanish.

## Examples

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
