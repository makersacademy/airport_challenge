require './lib/plane.rb'
class Airport
  attr_reader :capacity
  attr_reader :planes_at_airport

  def initialize(capacity = 3)
    @capacity = capacity
    @planes_at_airport = []
  end

  def land_plane(plane)
    @planes_at_airport.push(plane)
    @planes_at_airport.last
  end

  def take_off(plane)
    @planes_at_airport.delete(plane)
    @planes_at_airport.last
    @planes_at_airport
  end
end
