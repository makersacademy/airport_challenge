
class Plane
  attr_reader :flying
  def initialize
    @flying = false
  end

  def land(airport)
    raise "Landing prevented by weather" if stormy?
    raise "Airport at capacity, landing prevented" if airport.full?
    @flying = false
    airport.planes << self
  end

  def take_off(airport)
    raise "Take off prevented by weather" if stormy?
    @flying = true
    airport.planes.delete(self)
  end

private
  def stormy?
    var = rand(5)
    var == 3 ? true : false
  end
end
