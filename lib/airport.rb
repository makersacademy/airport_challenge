class Airport
  attr_reader :planes_in_airport

  def initialize
    @planes_in_airport = []
  end

  def land(a_plane)
    a_plane.landed
    @planes_in_airport << a_plane
  end

  def take_off(a_plane)
    fail 'Plane not at airport' unless a_plane.at_airport?
    a_plane.taken_off
    @planes_in_airport.delete(a_plane)
  end
end
