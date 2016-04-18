require_relative 'airport'

class Plane

  def initialize
    @landed = false
  end

  def land(airport)
    fail 'Plane has already landed!' if self.landed?
    fail 'Airport is full!' if airport.full?
    fail 'Too stormy to land!' if airport.stormy?
    airport.plane_land(self)
    @landed = true
    "Plane successfully landed!"
  end

  def take_off(airport)
    fail 'Plane is still flying!' unless self.landed?
    fail 'Airport is empty!' if airport.empty?
    fail 'Too stormy to take off!' if airport.stormy?
    airport.plane_take_off(self)
    @landed = false
    "Plane successfully taken off!"
  end

  def landed?
    @landed
  end

end
