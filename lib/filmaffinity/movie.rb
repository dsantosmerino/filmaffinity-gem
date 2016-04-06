module FilmAffinity
  class Movie
    attr_reader :id, :title
    def initialize id,title
      @id = id
      @title = title
    end

    def cast
      ["Jim Carrey",
      "Laura Linney",
      "Noah Emmerich",
      "Ed Harris"]
    end

  end
end
