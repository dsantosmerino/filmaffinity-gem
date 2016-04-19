module FilmAffinity
  class Movie
    attr_reader :id, :title
    def initialize(id, title = nil)
      @id = id
      @title = title if title
      @json_parser = JsonMovieParser.new
      @poster_manager = PosterManager.new
    end

    def document_html
      @document_html ||= Nokogiri::HTML(generate_html)
    end

    def generate_html
      open(Constants.urls[:movie] % id)
    end

    def title
      @title ||= document_html.at(Constants.tag(:title)).content.strip
    end

    def year
      document_html.at(Constants.tag(:year)).content[/\d+/].to_i
    end

    def duration
      document_html.at(Constants.tag(:duration)).content[/\d+/].to_i
    end

    def country
      raw_country = document_html.at(Constants.tag(:country)).next_sibling.content
      raw_country.gsub(/\A[[:space:]]+|[[:space:]]+\z/, '')
    end

    def director
      raw_director = document_html.at(Constants.tag(:director)).content
      raw_director.strip
    end

    def music
      document_html.at(Constants.tag(:music)).next_sibling.next_sibling.content
    end

    def company
      document_html.at(Constants.tag(:company)).next_sibling.next_sibling.content
    end

    def script
      document_html.at(Constants.tag(:script)).next_sibling.next_sibling.content
    end

    def photography
      document_html.at(Constants.tag(:photography)).next_sibling.next_sibling.content
    end

    def cast
      actors = []
      node = document_html.search(Constants.tag(:cast))
      node.each do |actor|
        actors << actor.at(Constants.tag(:cast_each)).content.strip
      end
      actors
    end

    def genres
      genres = []
      node = document_html.at(Constants.tag(:genre)).next_sibling.next_sibling
      raw_genres = node.search("a")
      raw_genres.each do |raw_genre|
        genres << raw_genre.content.strip
      end
      genres
    end

    def sinopsis
      document_html.at(Constants.tag(:sinopsis)).content
    end

    def prizes
    end

    def rating
      raw_rating = document_html.at(Constants.tag(:rating)).content.strip
      raw_rating.tr(",", ".").to_f
    end

    def poster
      poster_url = document_html.at(Constants.tag(:poster))["src"]
      @poster_manager.load_poster(poster_url)
    end

    def poster_big
      poster_url = document_html.at(Constants.tag(:poster_big))["href"]
      @poster_manager.load_poster(poster_url)
    end

    def to_json
      @json_parser.to_json self
    end
  end
end
