class Plane

  def initialize(airport=nil) # nil is not at an airport/in flight
    @airport = airport
  end

  def take_off
    # used fail to keep Hound happy, but bbatsov says to use raise??
    fail "Plane is already airborne." unless airport
    airport = nil
    airport
  end

  def land(destination)
    fail "Plane is already on the ground." if airport
    airport = destination
    airport
  end

  private

  attr_accessor :airport

end
