module Constants



  def self.query_params
    {
      :genre => "genre=%s&",
      :country => "country=%s&",
      :from_year => "fromyear=%i&",
      :to_year => "toyear=%i&",
      :no_doc => "nodoc&",
      :no_tv => "notvse&",
    }
  end
  def self.urls
    {
      :top => "http://www.filmaffinity.com/es/topgen.php%s",
      :search_by_title => "http://www.filmaffinity.com/es/search.php?stext=%s&stype=title",
      :movie => "http://www.filmaffinity.com/es/film%i.html"
    }
  end

  def self.tags
  
    {

      :title => { :EN => '#main-title span',
                  :ES => '#main-title span'
      },

      :year => { :EN => 'dd[itemprop="datePublished"]',
                :ES => 'dd[itemprop="datePublished"]'
      },

      :duration => { :EN => 'dd[itemprop="duration"]',
                    :ES => 'dd[itemprop="duration"]'
      },

      :country => { :EN => '#country-img',
                    :ES => '#country-img'
      },

      :director => { :EN => 'a[itemprop="url"]',
                    :ES => 'a[itemprop="url"]'
      },

      :music => { :EN => 'dt:contains("Music")',
                  :ES => 'dt:contains("Música")'
      },

      :company => { :EN => 'dt:contains("Producer")',
                    :ES => 'dt:contains("Productora")'
      },

      :script => {:EN => 'dt:contains("Screenwriter")',
                  :ES => 'dt:contains("Guión")'
      },
      
      :photography => { :EN => 'dt:contains("Cinematography")',
                        :ES => 'dt:contains("Fotografía")'
      },

      :cast => { :EN => 'span[itemprop="actor"]',
                  :ES => 'span[itemprop="actor"]'
      },

      :cast_each => { :EN => 'span[itemprop="name"]',
                      :ES => 'span[itemprop="name"]'
      },

      :genre => { :EN => 'dt:contains("Genre")',
                  :ES => 'dt:contains("Género")'
      },

      :sinopsis => { :EN => 'dd[itemprop="description"]',
                      :ES => 'dd[itemprop="description"]'
      },

      :rating => { :EN => 'div[itemprop="ratingValue"]',
                  :ES => 'div[itemprop="ratingValue"]'
      },

      :poster => { :EN => 'img[itemprop="image"]',
                  :ES => 'img[itemprop="image"]'
      }
    }
  end

  def self.tag(type)
    Constants.tags[type][:ES]
  end

end
