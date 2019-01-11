require_relative 'plane'

class Airport

  attr_reader :planes_at_airport, :plane_that_left

  def initialize
    @planes_at_airport = []
    @plane_that_left = 0
  end

  def land(plane)
    @planes_at_airport << plane
  end

  def take_off(plane)
    @plane_that_left = @planes_at_airport.delete(plane)

    if @planes_at_airport.include?(@plane_that_left) == false
      return "Plane #{@plane_that_left} has left"
    end
  end


end
