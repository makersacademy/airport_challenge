require_relative 'plane'
require_relative 'weather'

class Airport

  attr_reader :plane

  def land_plane

  end

  def take_off(*)
    fail "Stormy weather prevents takeoff" if Weather.stormy
  end

end
