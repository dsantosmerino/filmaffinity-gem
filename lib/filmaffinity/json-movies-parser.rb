class JsonMoviesParser
  def to_hashes(movies)
    hashes = []
    movies.each do |movie|
      hash = {
        'id' => movie.id,
        'title' => movie.title
      }
      hashes << hash
    end
    hashes
  end

  def to_json(movies)
    hashes = to_hashes movies
    hashes.to_json
  end
end
