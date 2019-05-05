require_relative 'plane'
require_relative 'weather'


class Airport

  attr_reader :planes

  def initialize
    @planes = []
  end

  def land(plane)
    @planes << plane
  end

  def takeoff
    weather = Weather.new
    fail "Stormy weather conditions" if weather.is_stormy?
    @planes.pop
    "The plane has left the airport"
  end

end
