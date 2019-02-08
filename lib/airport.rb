# Need the airport class to take in a plane
require_relative 'weather'

class Airport
  attr_reader :airport
  attr_reader :stormy

  def initialize
    @airport = []
  end

  def land_plane(plane)
    weather = Weather.new
    @stormy = weather.stormy?
    if @stormy
      fail "Not safe to land when there is a storm!"
    else
      @airport << plane.plane_name
    end
  end

  def takeoff_plane(plane)
    weather = Weather.new
    @stormy = weather.stormy?
    if @stormy
      fail "Not safe to take off when there is a storm!"
    else
      @airport.delete(plane)
      plane
    end
  end
end
