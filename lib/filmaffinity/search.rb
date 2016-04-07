require "cgi"

module FilmAffinity
  class Search
    def initialize query
      @query = query
    end

    def movies
      movies = []
      create_document_html.search(".movie-card.movie-card-1").each do |movie_card|
        id = movie_card["data-movie-id"].to_i
        title = movie_card.search(".mc-title a").first.content.strip
        movie = FilmAffinity::Movie.new id, title
        movies << movie
      end
      movies
    end

    def create_document_html
      @document_html ||= Nokogiri::HTML(self.generate_html)
    end

    def generate_html
      open("http://www.filmaffinity.com/es/search.php?stext=#{CGI.escape(@query)}&stype=title")
    end

    def parse_movie
      id    = create_document_html.at('meta[property="og:url"]')['content'][/\d+/]
      title = create_document_html.at('meta[property="og:title"]')['content']
      FilmAffinity::Movie.new(id,title)
    end
  end
end
