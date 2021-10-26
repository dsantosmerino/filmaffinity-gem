# frozen_string_literal: true

require 'open-uri'
require 'nokogiri'

require_relative 'constants/constants'
require_relative 'filmaffinity/configuration'
require_relative 'filmaffinity/poster_manager'
require_relative 'filmaffinity/json_movies_parser'
require_relative 'filmaffinity/json_movie_parser'
require_relative 'filmaffinity/movie'
require_relative 'filmaffinity/search'
require_relative 'filmaffinity/top'

module FilmAffinity
  class << self
    attr_writer :configuration

    def configuration
      @configuration ||= Configuration.new
    end

    def configure
      yield(configuration)
    end
  end
end
