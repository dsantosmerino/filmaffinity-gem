# FilmAffinity Scraper Gem
[![Gem Version](https://badge.fury.io/rb/filmaffinity.svg)](http://badge.fury.io/rb/filmaffinity)

## Description

The filmaffinity gem allows you to easy access publicly available data from **Filmaffinity.com in english and spanish**.

Also available as **REST API** at [heroku](https://filmaffinity-unofficial.herokuapp.com/).

## Features

- Search movies for a title
- Retrieve complete movie info
- Retrieve the Top N of filmaffinity.com
- Retrieve the Top N with the given options

## Installation

Add this line to your application's Gemfile:

    gem 'filmaffinity'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install filmaffinity

## Documentation

##### FilmAffinity configuration
FilmAffinity has some configuration options, which you can configure globally before your requests. Could include an ```imgur_id``` to upload the posters on Imgur and avoid forbidden hotlinking from filmaffinity. Also you can change the ```language```, english by default. 
```
FilmAffinity.configure do |config|
  config.imgur_id = 'Your-imgur-client-id'
  config.language = 'ES'
end
```

##### FilmAffinity::Search
Return an array of FilmAffinity::Movie, just containing preload ID and title.

##### FilmAffinity::Movie
Include some methods to retrieve the complete movie info.

##### FilmAffinity::Top options
The options hash could include:
```
{
  :genre => 'AC',
  :country => 'DE',
  :from_year => 2014,
  :to_year => 2016,
  :no_doc => true,
  :no_tv => true
}
  ```
##### :genre
- 'AC'    Action
- 'AV'    Adventure
- 'AN'    Animation
- 'CO'    Comedy
- 'DO'    Documentary
- 'DR'    Drama
- 'FAN'   Fantasy
- 'F-N'   Film-Noir
- 'TE'    Horror
- 'INF'   Kids
- 'MU'    Musical
- 'INT'   Mystery
- 'RO'    Romance
- 'C-F'   Sci-Fi
- 'TH'    Thriller
- 'TV_SE' TV Series
- 'DESC'  Unknown
- 'BE'    War
- 'WE'    Western

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
      :genre => 'AN',
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

    search = FilmAffinity::Search.new('Padrino')

    search.movies
    #=> [<FilmAffinity::Movie>
         <FilmAffinity::Movie>
         <FilmAffinity::Movie>
         ...]

    search.movies.first
    #=> #<FilmAffinity::Movie>

### Movie:

    movie = FilmAffinity::Movie.new(809297, 'El Padrino')

    movie.director
    #=> 'Francis Ford Coppola'

    movie.year
    #=> 1972

    movie.rating
    #=> 9.1

    movie.cast
    #=> ['Marlon Brando',
         'Al Pacino',
         'James Caan',
         'Robert Duvall',
         'Diane Keaton',
         ...]

   movie.genres, movie.country, movie.sinopsis...

## Contributors

This gem is created and maintained by [Oriol Bellido](https://github.com/oricodes89) and [David Santos](https://github.com/davidsantosmerino)
