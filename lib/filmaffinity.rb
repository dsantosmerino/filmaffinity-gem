require 'open-uri'
require 'nokogiri'

require_relative 'constants/constants'
require_relative 'filmaffinity/configuration'
require_relative 'filmaffinity/poster-manager'
require_relative 'filmaffinity/json-movies-parser'
require_relative 'filmaffinity/json-movie-parser'
require_relative 'filmaffinity/movie'
require_relative 'filmaffinity/search'
require_relative 'filmaffinity/top'
# Module FilmAffinity
module FilmAffinity
  class << self
    attr_accessor :configuration
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.configure
    yield(configuration)
  end
end
