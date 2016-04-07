require 'rspec'
$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")
require 'filmaffinity'


def read_fixture path
  File.read(File.expand_path(File.join(File.dirname(__FILE__), 'fixtures', path)))
end

FILMAFFINITY_SAMPLES = {
  "http://www.filmaffinity.com/es/film504889.html" => "film504889"
}


# FakeWeb.allow_net_connect = false
# FILMAFFINITY_SAMPLES.each do |url, response|
#  FakeWeb.register_uri(:get, url, response: read_fixture(response))
# end
