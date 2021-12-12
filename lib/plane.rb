class Plane
  attr_reader :location

  def land(airport)
    airport.receive(self)
    @location = airport
  end

  def takeoff
    @location.release(self)
    @location = "In Flight"
  end
end
