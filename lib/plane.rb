require_relative 'airport.rb'
class Plane
  attr_reader :location
  attr_writer :location
  def initialize
    @location = 'flying'
  end

  def land(airport)
    airport.land_plane(self)
  end

  def takeoff(airport)
    airport.takeoff_plane(self)
    @location = 'flying'
  end
end
