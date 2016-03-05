require_relative 'weather'

class Plane
  attr_reader :flying
  def initialize
    @flying = true
  end

  def land(airport)
    airport.receive_plane(self)
    @flying = false
  end

  def takeoff(airport)
    airport.release_plane(self)
    @flying = true
  end

  def storm_check
    Weather.new.storm
  end

end
