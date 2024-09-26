require_relative 'plane'
require_relative 'weather'

class Airport
  DEFAULT_CAPACITY = 20

  attr_reader :planes_at_airport, :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes_at_airport = []
    @capacity = capacity
  end

  def incoming_plane(plane)
    raise "** No landings due to storm **" if can_plane_take_off?
    raise "** Already landed **" if @planes_at_airport.count(plane).positive?
    raise "** Airport is full **" if full?

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

  def full?
    @planes_at_airport.count == @capacity
  end

end
