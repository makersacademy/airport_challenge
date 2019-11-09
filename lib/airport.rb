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

    plane.in_air = false
    @planes << plane
  end

  def take_off_plane(plane, weather)
    raise "Cannot take off: Weather is stormy" if weather.getweather == "stormy"

    @planes.delete(plane)
    plane.in_air = true
  end
end
