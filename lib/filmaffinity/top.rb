require "cgi"

module FilmAffinity
  class Top
    def initialize options = nil
      @options = options
    end

    def movies
      @movies ||= parse_movies
    end

    def document_html
      @document_html ||= Nokogiri::HTML(self.generate_html)
    end

    def generate_html
      open("http://www.filmaffinity.com/es/topgen.php")
    end

    def parse_movies
      movies = []
      document_html.search(".movie-card.movie-card-1").each do |movie_card|
        id = movie_card["data-movie-id"].to_i
        title = movie_card.search(".mc-title a").first.content.strip
        movie = FilmAffinity::Movie.new id, title
        movies << movie
      end
      movies
    end

  end
end
