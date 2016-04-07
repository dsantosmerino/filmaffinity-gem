module Constants

  def self.query_options
    {
      :genre => "genre=",
      :country => "countr=",
      :from_year => "fromyear=",
      :to_year => "toyear=",
      :no_doc => "nodoc",
      :no_tv => "notvse",
    }
  end

  def self.urls
    {
      :top => "http://www.filmaffinity.com/es/topgen.php",
      :search_by_title => "http://www.filmaffinity.com/es/search.php?stext=%s&stype=title",
      :movie => "http://www.filmaffinity.com/es/film%i.html"
    }
  end

end
