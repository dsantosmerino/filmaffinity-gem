module Constants
  def self.query_params
    {
      genre: 'genre=%s&',
      country: 'country=%s&',
      from_year: 'fromyear=%i&',
      to_year: 'toyear=%i&',
      no_doc: 'nodoc&',
      no_tv: 'notvse&'
    }
  end

  def self.urls
    {
      top: "https://www.filmaffinity.com/#{lang}/topgen.php%s",
      search_by_title: "https://www.filmaffinity.com/#{lang}/search.php?stext=%s&stype=title",
      movie: "https://www.filmaffinity.com/#{lang}/film%i.html"
    }
  end

  def self.tags
    {

      title: { EN: '#main-title span',
               ES: '#main-title span'
      },

      year: { EN: 'dd[itemprop="datePublished"]',
              ES: 'dd[itemprop="datePublished"]'
      },

      duration: { EN: 'dd[itemprop="duration"]',
                  ES: 'dd[itemprop="duration"]'
      },

      country: { EN: '#country-img',
                 ES: '#country-img'
      },

      director: { EN: 'a[itemprop="url"]',
                  ES: 'a[itemprop="url"]'
      },

      music: { EN: 'dt:contains("Music")',
               ES: 'dt:contains("Music")'
      },

      company: { EN: 'dt:contains("Producer")',
                 ES: 'dt:contains("Productora")'
      },

      script: { EN: 'dt:contains("Screenwriter")',
                ES: 'dt:contains("Guion")'
      },

      photography: { EN: 'dt:contains("Cinematography")',
                     ES: 'dt:contains("Fotografía")'
      },

      cast: { EN: 'span[itemprop="actor"]',
              ES: 'span[itemprop="actor"]'
      },

      cast_each: { EN: 'span[itemprop="name"]',
                   ES: 'span[itemprop="name"]'
      },

      genre: { EN: 'dt:contains("Genre")',
               ES: 'dt:contains("Género")'
      },

      sinopsis: { EN: 'dd[itemprop="description"]',
                  ES: 'dd[itemprop="description"]'
      },

      rating: { EN: 'div[itemprop="ratingValue"]',
                ES: 'div[itemprop="ratingValue"]'
      },

      poster: { EN: 'img[itemprop="image"]',
                ES: 'img[itemprop="image"]'
      },

      poster_big: { EN: 'a[class="lightbox"]',
                    ES: 'a[class="lightbox"]'
      }

    }
  end

  def self.tag(type)
    lang = FilmAffinity.configuration.language.to_sym
    Constants.tags[type][lang]
  end

  def self.lang
    FilmAffinity.configuration.language.downcase
  end
end
