require_relative './weather'

class Airport

  attr_accessor :weather, :planes

  DEFAULT_CAPACITY = 10

  def initialize
    @weather = Weather.new
    @planes = []
  end

  def clear?
    @weather.randomize
    !@weather.stormy
  end

end