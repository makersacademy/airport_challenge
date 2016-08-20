require_relative './plane.rb'
require_relative './weather.rb'

class Airport

  attr_reader :weather
  
  def initialize
    @planes = []
    @weather = Weather.new
  end

  def land(plane)
    @planes << plane
    self
  end

  def take_off(plane)
    fail "Planes cannot take off in stormy weather" if @weather.stormy
    @planes.delete(plane)
  end

  def planes
    @planes
  end

end
