require_relative 'weather'

class Plane
  attr_reader :flying, :weather
  def initialize
    @weather = Weather.new
    @flying = true
  end

  def land(airport)
    fail "Cannot land in stormy weather." if storm_check
    fail "Cannot land if airport is full." if airport.full?
    airport.receive_plane(self)
    @flying = false
  end

  def takeoff(airport)
    #raise "I'm not there!" if !airport.planes.include?(self)
    fail "Cannot take off in stormy weather." if storm_check
    airport.release_plane(self)
    @flying = true
  end

  def storm_check
    @weather.storm
  end

end
