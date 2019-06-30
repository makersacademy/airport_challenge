require_relative 'weather'

class Airport
  attr_reader :airport

  def initialize
    @airport = []
  end

  def land_plane(plane)
    @airport << plane
  end

  def take_off
    @airport.pop unless weather.stormy == true
    return @airport
  end

  def prevent_take_off(weather)
    fail "Plane cannot take off" if weather.stormy == true
  end

  def prevent_landing(weather)
    fail "Plane cannot land" if weather.stormy == true
  end

end
