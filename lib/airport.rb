require_relative './plane'

class Airport
  attr_reader :plane_capacity, :planes_at_airport
  def initialize(plane_capacity = 50)
    @plane_capacity = plane_capacity
    @planes_at_airport = []
  end

  def land(plane)
    if @planes_at_airport.count == @plane_capacity
      raise "Cannot land, airport is full"
    elsif @planes_at_airport.include?(plane) 
      raise "You can't land a plane that's already at the airport"
    else
      @planes_at_airport.push(plane)
    end
  end

  def take_off(plane)
    unless @planes_at_airport.include?(plane)
      raise "Cannot instruct a plane that isn't at the airport to take off"
    else
      @planes_at_airport.delete(plane)
    end
  end
end
