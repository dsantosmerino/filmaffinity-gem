
class Configuration
  attr_accessor :imgur_id, :language

  def initialize
    @imgur_id = nil
    @language = 'EN'
  end
end
