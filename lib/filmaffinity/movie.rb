module FilmAffinity
  class Movie
    attr_reader :id, :title
    def initialize id,title
      @id = id
      @title = title
    end

    def document_html
      @document_html ||= Nokogiri::HTML(self.generate_html)
    end

    def generate_html
      open("http://www.filmaffinity.com/es/film#{@id}.html")
    end

    def year
      document_html.at('dd[itemprop="datePublished"]').content[/\d+/].to_i
    end

    def duration
      document_html.at('dd[itemprop="duration"]').content[/\d+/].to_i
    end

    def country
      raw_country = document_html.at("#country-img").next_sibling
      raw_country.
    end

    def director
      document_html.at('dd[itemprop="datePublished"]').content[/\d+/].to_i
    end

    def script
      document_html.at('dd[itemprop="datePublished"]').content[/\d+/].to_i
    end

    def music
      document_html.at('dd[itemprop="datePublished"]').content[/\d+/].to_i
    end

    def photography
      document_html.at('dd[itemprop="datePublished"]').content[/\d+/].to_i
    end

    def cast
      ["Jim Carrey",
      "Laura Linney",
      "Noah Emmerich",
      "Ed Harris"]
    end

    def company

    end

    def genre

    end

    def sinopsis

    end

    def prizes

    end

    def rating

    end



  end
end
