require_relative 'airport'
require_relative 'weather'

class Plane
  attr_reader :landed

  def initialize
    @landed = false
  end

  def land(airport, weather = Weather.new)
    fail 'Plane is not in flight' if landed == true
    fail 'Too stormy to land' if weather.stormy? == true
    fail 'Airport is too full to land' if airport.full? == true
    @landed = true
    airport.planes << self
  end

  def take_off(airport, weather = Weather.new)
    fail 'Plane is already in flight' if landed == false
    fail 'Plane is not at given airport' if
    airport.planes.include?(self) == false
    fail 'Too stormy to take off' if weather.stormy? == true
    @landed = false
    airport.planes.delete(self)
  end

end
