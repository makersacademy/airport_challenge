require_relative 'weather'

class Plane
  attr_reader :flying
  def initialize
    @flying = true
  end

  def land(airport)
    if storm_check
      raise "Cannot land in stormy weather."
    else
    airport.receive_plane(self)
    @flying = false
    end
  end

  def takeoff(airport)
    if storm_check
      raise "Cannot take off in stormy weather."
    else
    airport.release_plane(self)
    @flying = true
    end
  end

  def storm_check
    Weather.new.storm
  end

  def stormy?
    true
  end

end
