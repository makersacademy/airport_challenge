class Plane

  def initialize(airport=nil) # nil is not at an airport/in flight
    @airport = airport
  end

  def take_off
    raise "Plane is already airborne." unless airport
    airport = nil
    airport
  end

  def land(destination)
    raise "Plane is already on the ground." if airport
    airport = destination
    airport
  end

  private

  attr_accessor :airport

end
