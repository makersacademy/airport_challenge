class Plane

  attr_reader :location 

  def initialize(location)
    @location = location
    location.planes << self
    @in_flight = false
  end

  def take_off
    @in_flight = true
  end

  def land
    @in_flight = false
  end

  def in_flight?
    @in_flight
  end
end
