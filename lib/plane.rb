
class Plane
  attr_accessor :location

  def intialize 
    @location = 'airport'
  end

  def land(airport)
    airport.planes << self
  end

  def take_off
  end

  def in_airport?
  end

end
