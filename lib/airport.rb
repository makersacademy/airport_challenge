require_relative 'weather'

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
    fail "Too stormy to fly" if bad_weather?
    a_plane.taken_off
    @planes_in_airport.delete(a_plane)
  end

  private

  def bad_weather?
    Weather.new.stormy?
  end

end
