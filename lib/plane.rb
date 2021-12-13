class Plane
  attr_reader :location

  def initialize
    @location = "In Flight"
  end

  def land(airport)
    fail("Already Landed") unless location == "In Flight"
    airport.receive(self)
    @location = airport
    
  end

  def takeoff
    fail("Cannot Takeoff From The Sky") if location == "In Flight"
    location.release(self)
    @location = "In Flight"
  end
end
