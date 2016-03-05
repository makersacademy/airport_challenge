require_relative 'weather'

class Airport
  attr_reader :landed_planes

  def initialize
    @landed_planes = []
  end

  def land(a_plane)
    fail "Too stormy to land" if bad_weather?
    @landed_planes << a_plane
  end

  def take_off(a_plane)
    fail 'Plane not at airport' unless in_airport?(a_plane)
    fail "Too stormy to fly" if bad_weather?
    @landed_planes.delete(a_plane)
  end

  def in_airport?(a_plane)
    @landed_planes.include? a_plane
  end

  private

  def bad_weather?
    Weather.new.stormy?
  end

end
