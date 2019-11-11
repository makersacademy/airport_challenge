require './lib/plane.rb'
require './lib/weather.rb'

class Airport
  DEFAULT_CAPACITY = 10
  attr_accessor :planes
  attr_reader :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
  end

  def land_plane(plane, weather)
    raise "Cannot land plane: Airport full" if @planes.count >= @capacity
    raise "Cannot land plane: Weather is stormy" if weather.getweather == "stormy"

    plane.land
    @planes << plane
  end

  def take_off_plane(plane, weather)
    raise "Cannot take off: Weather is stormy" if weather.getweather == "stormy"

    plane.takeoff
    @planes.delete(plane)
  end
end
