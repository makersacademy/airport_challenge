class Plane
  attr_reader :location

  def initialize
    @location = "Factory"
  end

  def land(airport)
    airport.receive(self)
    @location = airport
  end

  def takeoff
    fail "Cannot Takeoff From The Sky" if location == "In Flight"
    location.release(self) unless location == "Factory"
    @location = "In Flight"
  end
end
