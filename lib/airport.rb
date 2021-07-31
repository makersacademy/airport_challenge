require_relative 'plane'
require_relative 'weather'

class Airport

  DEFAULT_CAPACITY = 5

  attr :planes, :capacity, :weather_chart

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @weather_chart = [:sunny, :stormy, :sunny, :stormy, :sunny, :sunny, :sunny]
    @capacity = capacity
  end

  def land(plane, weather)
    fail 'Airport is at full capacity' if @planes.length >= DEFAULT_CAPACITY
    fail 'Weather is too bad' if weather.isStormy?
    @planes << plane
    plane.plane_arrives
  end

  def take_off(plane, weather)
    fail 'Weather is too bad' if weather.isStormy?
    planes.delete(plane)
    plane.plane_leaves
  end
end

# my_plane = Plane.new
# weather_forecast = Weather.new([:sunny, :stormy, :sunny, :stormy, :sunny, :sunny, :sunny])
# airport = Airport.new
# airport.land(my_plane, weather_forecast)
# puts airport.planes.length
# airport.take_off(my_plane, weather_forecast)
# puts airport.planes.length
