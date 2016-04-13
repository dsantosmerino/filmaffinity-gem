
require "pry"
module FilmAffinity
  class Top
    def initialize options: {}, limit: 30
      @options = options
      @limit = limit
      @json_parser = JsonMoviesParser.new
    end

    def movies
      @movies = movies_with_limit
    end

    def document_html from
      @document_html = Nokogiri::HTML(self.generate_html(from))
    end

    def generate_html from
      params = {'from' => from}
      url = URI.parse(Constants.urls[:top] % query_options)
      data = Net::HTTP.post_form(url, params)
      data.body
    end

    def query_options
      query_options = String.new
        query_options += "?"
        @options.each do |key,value|
          query_options += Constants.query_params[key] % value
        end
      query_options.gsub(/\&$/,"")
    end

    def movies_with_limit
      collect_from do |from|
        doc_obj = document_html from
        parse_movies doc_obj
      end
    end

    def collect_from collection = [], from = 0, &block
      response = yield(from)
      collection += response
      last_position = collection.size
      response.empty? || last_position >= @limit ? collection.flatten : collect_from(collection,last_position,&block)
    end

    def parse_movies document_html
      movies = []
      document_html.search(".movie-card.movie-card-1").each_with_index do |movie_card,index|
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
