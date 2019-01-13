require_relative 'plane'
require_relative 'weather'

class Airport

  attr_reader :planes_at_airport, :plane_that_left, :weather

  def initialize
    @planes_at_airport = []
    @plane_that_left = 0
    @weather = Weather.new
  end

  def land(plane)
    fail ("Unable to land, it's stormy") if no_go?
    @planes_at_airport << plane
  end

  def take_off(plane)
    fail ("Unable to take off") if no_go?
    @plane_that_left = @planes_at_airport.delete(plane)
      if @planes_at_airport.include?(@plane_that_left) == false
        return "Plane #{@plane_that_left} has left"
      end

  end

private
  def no_go?
    weather.stormy?
  end

end
