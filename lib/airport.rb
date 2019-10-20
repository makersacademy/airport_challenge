require_relative 'plane'
require_relative 'weather'

class Airport
  attr_reader :planes_at_airport
  def initialize
    @planes_at_airport = []
  end

  def incoming_plane(plane)
    raise "** No landings due to storm **" if can_plane_take_off?
    raise "** Plane is already at airport **" if @planes_at_airport.count(plane) > 0
    @planes_at_airport << plane
    plane.location = self
  end

  def outgoing_plane(plane)
    raise "** No take offs due to storm **" if can_plane_take_off?

    @planes_at_airport.delete(plane)
    plane.location = "air"
    "Plane has left airport"
    
  end

  private

  def can_plane_take_off?
    weather = Weather.new
    weather.stormy?
  end

end
