require './lib/plane'
require './lib/weather'

class Airport

  attr_reader :plane
  #this allows us to store our plane variables as @plane

  #
  # def initialize
  #   @planes = []
  # end
  #
  # def land_at_airport(plane)
  #   @planes << @plane
  # end
  #
  # def take_off(plane)
  #   @planes.pop
  # end

  def land_at_airport(plane)
    # weather = Weather.new
    # fail "Too stormy!" if weather.stormy?
    plane
  end

  def take_off(plane)
    weather = Weather.new
    fail "Too stormy!" if weather.stormy?
    @plane = plane
  end

end
