module FilmAffinity
  class Top
    def initialize options = {}
      @options = options
      @json_parser = JsonMoviesParser.new
    end

    def movies
      @movies ||= parse_movies
    end

    def document_html
      @document_html ||= Nokogiri::HTML(self.generate_html)
    end

    def generate_html
      open(Constants.urls[:top] % query_options)
    end

    def query_options
      query_options = String.new
        query_options += "?"
        @options.each do |key,value|
          query_options += Constants.query_params[key] % value
        end
      query_options.gsub(/\&$/,"")
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
