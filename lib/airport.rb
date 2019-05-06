require_relative 'weather'
require_relative 'plane'

class Airport

  attr_accessor :capacity, :weather, :planes

  def initialize(capacity = 2)
    @capacity = capacity
    @weather = Weather.new
    @planes = []
  end

  def land(plane)
    fail "airport is full" if @planes.count >= 2
    fail "stormy weather conditions" if @weather.generate_weather == "stormy"

    @planes << plane
  end

  def takeoff
    fail "Stormy weather conditions" if @weather.generate_weather == "stormy"

    @planes.pop
    # "The plane has left the airport"
  end

end
