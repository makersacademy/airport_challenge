require_relative 'weather'

class Airport
  attr_reader :airport

  def initialize
    @airport = []
  end

  def land_plane(plane)
    @airport << plane
  end

  def take_off(plane)
    @airport.pop
  end

  def prevent_take_off(weather)
    fail "Plane cannot take off" if weather.stormy == true
  end

end
