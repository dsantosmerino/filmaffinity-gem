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
end
