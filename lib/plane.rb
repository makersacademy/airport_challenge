class Plane
attr_reader :location

  def initialize
    @location
  end

  def land(airport)
    raise "Airport is full" if airport.capacity == 10 
    @location = airport
  end

  def take_off
    @location = "sky"
  end
end
