require "cgi"

module FilmAffinity
  class Search
    def initialize query
      @query = query
    end

    def movies
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
