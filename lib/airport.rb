require_relative 'plane'
require_relative 'weather'

class Airport

  attr_reader :planes_at_airport, :plane_that_left

  def initialize
    @planes_at_airport = []
    @plane_that_left = 0
    @weather = Weather.new
  end

  def land(plane)
    @planes_at_airport << plane
  end

  def take_off(plane)
    fail 'Unable to take off' if @weather.stormy?
    
    @plane_that_left = @planes_at_airport.delete(plane)
      if @planes_at_airport.include?(@plane_that_left) == false
        return "Plane #{@plane_that_left} has left"
      end
  end
end
