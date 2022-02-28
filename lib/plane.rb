require_relative 'airport'

class Plane
  
  def initialize
    @status = "Airborne"
  end

  attr_accessor :status

  def land(airport)
    airport.full?
    fail "This plane has already landed" if @status.is_a?(Airport)
    if airport.stormy? == false
      @status = airport
      airport.landed_planes << self
      return airport.landed_planes
    else
      return "Could not land"
    end
  end

  def take_off(airport)
    fail "That plane is not at that airport" if airport != @status && @status.is_a?(Airport)
    fail "A flying plane can not take off" if @status == "Airborne"
    if airport.stormy? == false
      airport.landed_planes = airport.landed_planes - [self]
      @status = "Airborne"
    end
  end

end