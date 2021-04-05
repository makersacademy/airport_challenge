require_relative 'plane'
require_relative 'errors'
require_relative 'weather'

class Airport
  DEFAULT_CAPACITY = 30
  attr_reader :planes, :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def land(plane)
    full?
    plane.land_plane
    planes << plane 
  end

  def takeoff(plane)
    takeoff_checks(plane)
    planes.delete(plane)
    plane.takeoff_plane
    plane
  end

  private
  def full?
    raise LandingError if @planes.size >= DEFAULT_CAPACITY
  end

  def takeoff_checks(plane)
    raise TakeOffError if @planes.empty?
    raise PlaneError unless plane_in_airport?(plane)
    raise WeatherError if stormy_weather?
  end
  
  def plane_in_airport?(plane)
    planes.any? { |stored_plane| stored_plane == plane }
  end

  def weather_stormy?
    forecast == :stormy
  end

end
