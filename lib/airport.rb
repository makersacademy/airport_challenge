require_relative './weather'

class Airport

  attr_accessor :weather, :planes

  def initialize
    @weather = Weather.new
  end

  def clear?
    @weather.randomize
    !@weather.stormy
  end

end