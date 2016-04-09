require "cgi"

module FilmAffinity
  class Search
    def initialize query
      @query = query
      @json_parser = JsonMoviesParser.new
    end

    def movies
      @movies ||= (exact_match? ? parse_movie : parse_movies)
    end

    def exact_match?
      !document_html.at(".z-movie").nil?
    end

    def document_html
      @document_html ||= Nokogiri::HTML(self.generate_html)
    end

    def generate_html
      open(Constants.urls[:search_by_title] % CGI.escape(@query))
    end

    def parse_movie
      id    = document_html.at('meta[property="og:url"]')['content'][/\d+/].to_i
      title = document_html.at('meta[property="og:title"]')['content']
      [FilmAffinity::Movie.new(id,title)]
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

    def to_json
      @json_parser.to_json movies
    end

  end
end
