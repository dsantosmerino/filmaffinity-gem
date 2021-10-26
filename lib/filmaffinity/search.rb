# frozen_string_literal: true

require 'cgi'

module FilmAffinity
  class Search
    def initialize(query)
      @query = query
    end

    def movies
      @movies ||= (exact_match? ? parse_movie : parse_movies)
    end

    def to_json(*_args)
      @json_parser.to_json(movies)
    end

    private

    def json_parser
      @json_parser ||= JsonMoviesParser.new
    end

    def exact_match?
      !document_html.at('.z-movie').nil?
    end

    def document_html
      @document_html ||= Nokogiri::HTML(generate_html)
    end

    def generate_html
      URI.parse(Constants.urls[:search_by_title] % CGI.escape(@query)).open
    end

    def parse_movie
      id    = document_html.at('meta[property="og:url"]')['content'][/\d+/].to_i
      title = document_html.at('meta[property="og:title"]')['content']

      [FilmAffinity::Movie.new(id, title)]
    end

    def parse_movies
      document_html.search('.movie-card.movie-card-1').map do |movie_card|
        id = movie_card['data-movie-id'].to_i
        title = movie_card.search('.mc-title a').first.content.strip

        FilmAffinity::Movie.new(id, title)
      end
    end
  end
end
