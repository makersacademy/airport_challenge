require_relative 'airport'
require_relative 'weather'
class Plane
  attr_accessor :landed 

  def initialize
    @landed = false
    @weather = Weather.new
  end

  def land_plane(airport)
    fail 'Plane already landed' if landed
    fail 'It is too stormy to land' if weather_stormy?
    fail 'Airport is full' if airport.full?
    
    airport.planes << self
    @landed = true
  end

  def take_off_from(airport)
    fail 'Plane is not landed' unless landed
    fail 'It is too stormy to take off' if weather_stormy?
    fail 'Plane not at airport' unless plane_in_airport?(airport)

    airport.planes.delete(self)
    @landed = true
    "#{self} has taken off"
  end

  def weather_stormy?
    @weather.stormy
  end

  def plane_in_airport?(airport)
    airport.planes.include?(self)
  end
end 
