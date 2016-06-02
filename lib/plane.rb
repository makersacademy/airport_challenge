class Plane

  attr_reader :airport

  def initialize(airport=nil) # nil is not at an airport/in flight
    @airport = airport
  end

  def take_off
    # used fail to keep Hound happy, but bbatsov says to use raise??
    fail "Plane is already airborne." unless grounded?
    @airport = nil
    self
  end

  def land(airport)
    fail "Plane is already on the ground." if grounded?
    @airport = airport
    self
  end

  private

  def grounded?
    !@airport.nil?
  end

end
