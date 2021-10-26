# frozen_string_literal: true

require 'json'

class JsonMovieParser
  # rubocop:disable Metrics/MethodLength
  def to_hash(movie)
    {
      'title' => movie.title,
      'rating' => movie.rating,
      'director' => movie.director,
      'year' => movie.year,
      'duration' => movie.duration,
      'country' => movie.country,
      'script' => movie.script,
      'cast' => movie.cast,
      'sinopsis' => movie.sinopsis,
      'poster_big' => movie.poster_big
    }
  end
  # rubocop:enable Metrics/MethodLength

  def to_json(movie)
    to_hash(movie).to_json
  end
end
