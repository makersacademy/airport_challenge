class Plane
  attr_reader :location

  def initialize
    @location
  end

  def land(airport)
    raise "Too stormy to land" if airport.stormy?
    raise "Airport is full" if airport.full?
    @location = airport
    airport.hanger << self
  end

  def take_off(airport)
    raise "Plane is not in this airport" if @location == "sky"
    raise "Too stormy to take off" if airport.stormy?
    @location = "sky"
    airport.hanger.delete(self)
  end
end
