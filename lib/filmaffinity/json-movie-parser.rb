require "json"

class JsonMovieParser
  def to_hash(movie)
    {
      "title" => movie.title,
      "rating" => movie.rating,
      "director" => movie.director,
      "year" => movie.year,
      "duration" => movie.duration,
      "country" => movie.country,
      "script" => movie.script,
      "cast" => movie.cast,
      "sinopsis" => movie.sinopsis
    }
  end

  def to_json(movie)
    hash = to_hash movie
    hash.to_json
  end
end
