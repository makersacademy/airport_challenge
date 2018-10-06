class Plane
attr_reader :location

  def initialize
    @location
  end

  def land(airport)
    raise "Too stormy to land" if airport.stormy?
    raise "Airport is full" if airport.full?
    @location = airport
  end

  def take_off
    @location = "sky"
  end
end
