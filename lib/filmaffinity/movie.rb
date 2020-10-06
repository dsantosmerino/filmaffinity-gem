# frozen_string_literal: false

module FilmAffinity
  class Movie
    attr_reader :id

    def initialize(id, title = nil)
      @id = id
      @title = title
      @json_parser = JsonMovieParser.new
      @poster_manager = PosterManager.new
    end

    def document_html
      @document_html ||= Nokogiri::HTML(generate_html)
    end

    def generate_html
      URI.open(Constants.urls[:movie] % id)
    end

    def title
      @title ||= document_html.at(Constants.tag(:title)).content.strip
    rescue StandardError
      nil
    end

    def year
      document_html.at(Constants.tag(:year)).content[/\d+/].to_i
    rescue StandardError
      nil
    end

    def duration
      document_html.at(Constants.tag(:duration)).content[/\d+/].to_i
    rescue StandardError
      nil
    end

    def country
      document_html.at(Constants.tag(:country)).next_sibling.content&.gsub(/\A[[:space:]]+|[[:space:]]+\z/, '')
    rescue StandardError
      nil
    end

    def director
      document_html.at(Constants.tag(:director)).content&.strip
    rescue StandardError
      nil
    end

    def music
      document_html.at(Constants.tag(:music)).next_sibling.next_sibling.content
    rescue StandardError
      nil
    end

    def company
      document_html.at(Constants.tag(:company)).next_sibling.next_sibling.content
    rescue StandardError
      nil
    end

    def script
      document_html.at(Constants.tag(:script)).next_sibling.next_sibling.content
    rescue StandardError
      nil
    end

    def photography
      document_html.at(Constants.tag(:photography)).next_sibling.next_sibling.content
    rescue StandardError
      nil
    end

    def cast
      document_html.search(Constants.tag(:cast)).map do |actor|
        actor.at(Constants.tag(:cast_each)).content.strip
      end
    rescue StandardError
      []
    end

    def genres
      node = document_html.at(Constants.tag(:genre)).next_sibling.next_sibling
      raw_genres = node.search('a')
      raw_genres.map do |raw_genre|
        raw_genre.content.strip
      end
    rescue StandardError
      []
    end

    def sinopsis
      document_html.at(Constants.tag(:sinopsis)).content
    rescue StandardError
      nil
    end

    def rating
      raw_rating = document_html.at(Constants.tag(:rating)).content.strip
      raw_rating&.tr(',', '.')&.to_f
    rescue StandardError
      nil
    end

    def poster
      poster_url = document_html.at(Constants.tag(:poster))['src']
      @poster_manager.load_poster(poster_url) if poster_url
    rescue StandardError
      nil
    end

    def poster_big
      poster_url = document_html.at(Constants.tag(:poster_big))['href']
      @poster_manager.load_poster(poster_url) if poster_url
    rescue StandardError
      nil
    end

    def to_json(*_args)
      @json_parser.to_json(self)
    end
  end
end
