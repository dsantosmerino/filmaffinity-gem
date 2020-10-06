# frozen_string_literal: false

module FilmAffinity
  class Top
    def initialize(options: {}, limit: 30)
      @options = options
      @limit = limit
    end

    def movies
      @movies = movies_with_limit
    end

    def document_html(from)
      @document_html = Nokogiri::HTML(generate_html(from))
    end

    def generate_html(from)
      params = { 'from' => from }
      url = URI.parse(Constants.urls[:top] % query_options)
      data = Net::HTTP.post_form(url, params)
      data.body
    end

    def query_options
      query_options = '?'
      @options.each do |key, value|
        query_options += Constants.query_params[key] % value
      end
      query_options.gsub(/\&$/, '')
    end

    def movies_with_limit
      collect_from do |from|
        doc_obj = document_html from
        parse_movies doc_obj
      end
    end

    def collect_from(collection = [], from = 0, &block)
      response = yield(from)
      collection += response
      last_position = collection.size

      if response.empty? || last_position >= @limit
        collection.flatten[0..@limit - 1]
      else
        collect_from(collection, last_position, &block)
      end
    end

    def parse_movies(document_html)
      document_html.search('.movie-card.movie-card-0').map do |movie_card|
        id = movie_card['data-movie-id'].to_i
        title = movie_card.search('.mc-title a').first.content.strip

        FilmAffinity::Movie.new(id, title)
      end
    end

    def to_json(*_args)
      @json_parser.to_json(movies)
    end

    def json_parser
      @json_parser ||= JsonMoviesParser.new
    end
  end
end
