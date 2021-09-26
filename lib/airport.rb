require_relative './plane'

class Airport
  attr_reader :planes_at_airport, :plane_capacity
  def initialize(plane_capacity = 50)
    @plane_capacity = plane_capacity
    @planes_at_airport = []
  end

  def land(plane)
    if @planes_at_airport.count == @plane_capacity
      raise "Cannot land, airport is full"
    else
      @planes_at_airport.push(plane)
    end
  end
end