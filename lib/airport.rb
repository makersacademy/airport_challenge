class Airport
  attr_reader :capacity, :plane_at_airport

  def initialize(capacity = 3)
    @capacity = capacity
    @plane_at_airport = []
  end

  def land_plane(plane)
    @plane_at_airport.push(plane)
    @plane_at_airport.last
  end

  def take_off(plane)
    @plane_at_airport.delete(plane)
    @plane_at_airport.last
  end
end
