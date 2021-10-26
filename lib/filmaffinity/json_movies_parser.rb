# frozen_string_literal: true

class JsonMoviesParser
  def to_hashes(movies)
    movies.map do |movie|
      {
        'id' => movie.id,
        'title' => movie.title
      }
    end
  end

  def to_json(movies)
    to_hashes(movies).to_json
  end
end
