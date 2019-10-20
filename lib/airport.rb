require_relative 'plane'

class Airport
  attr_reader :planes_at_airport
  def initialize
    @planes_at_airport = []
  end

  def incoming_plane(plane)
    @planes_at_airport << plane
  end

  def outgoing_plane(plane)
    raise RuntimeError if can_plane_take_off?
    @planes_at_airport.delete(plane)
    "Plane has left airport"
  end



  def can_plane_take_off?
    weather = Weather.new
    weather.stormy?
  end

end
