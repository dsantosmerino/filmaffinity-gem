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
      raw_country = document_html.at("#country-img").next_sibling.content
      raw_country.gsub(/\A[[:space:]]+|[[:space:]]+\z/, '')
    end

    def director
      raw_director = document_html.at('a[itemprop="url"]').content
      raw_director.strip
    end

    def script
      document_html.at('dt:contains("Guión")').next_sibling.next_sibling.content
    end

    def music
      document_html.at('dt:contains("Música")').next_sibling.next_sibling.content
    end

    def photography
      document_html.at('dt:contains("Fotografía")').next_sibling.next_sibling.content
    end

    def cast
      actors = []
      node = document_html.search('span[itemprop="actor"]')
      node.each do |actor|
        actors << actor.at('span[itemprop="name"]').content.strip
      end
      actors
    end

    def company
      document_html.at('dt:contains("Productora")').next_sibling.next_sibling.content
    end

    def genres
      genres = []
      node = document_html.at('dt:contains("Género")').next_sibling.next_sibling
      raw_genres = node.search("a")
      raw_genres.each do |raw_genre|
        genres << raw_genre.content.strip
      end
      genres

    end

    def sinopsis
      document_html.at('dd[itemprop="description"]').content
    end

    def prizes

    end

    def rating
      raw_rating = document_html.at('div[itemprop="ratingValue"]').content.strip
      raw_rating.gsub(",",".").to_f
    end
  end
end
