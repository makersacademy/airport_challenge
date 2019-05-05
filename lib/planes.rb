require_relative './airports.rb'

class Plane
  def initialize
    @landed = false
  end
  def land_at(airport)
    raise 'Airport at capacity' if airport.at_capacity?
    raise 'This plane is already landed' if @landed
    raise 'Too stormy to land' if airport.stormy?
    airport.planes << self
    @landed = true
    'Plane successfully landed'
  end

  def take_off_from(airport)
    raise 'The plane is not at this airport' unless airport.planes.include?(self)
    raise 'Too stormy to take off' if airport.stormy?
    airport.planes.delete(self)
    @landed = false
    'Plane successfully took off'
  end

  def local_weather_stormy?
    rand(10) < 2
  end
end
