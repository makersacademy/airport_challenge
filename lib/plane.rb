
class Plane
  attr_reader :flying
  def initialize
    @flying = false
  end

  def land(airport)
    raise "Plane is not in the air" if !flying
    raise "Landing prevented by weather" if stormy?
    raise "Airport at capacity, landing prevented" if airport.full?
    @flying = false
    airport.add_plane(self)
  end

  def take_off(airport)
    # raise "Plane is not in that airport" if !airport.planes.include?(self)
    raise "Take off prevented by weather" if stormy?
    @flying = true
    airport.remove_plane(self)
  end

private
  def stormy?
    var = rand(5)
    var == 3 ? true : false
  end
end
