class Plane
  attr_reader :location

  def initialize
    @location = :sky
  end

  def land(airport, weather)
    landing_checks(airport, weather)
    airport.landed_planes << self
    @location = airport
  end

  def take_off(airport, weather)
    take_off_checks(airport, weather)
    airport.landed_planes.delete(self)
    @location = :sky
  end

  private

  def landing_checks(airport, weather)
    raise "Airport is full!" if airport.landed_planes.count >= airport.capacity
    raise "Already in the airport." if airport.landed_planes.include? self
    raise "Already in a different airport." unless location == :sky
    raise "Stormy weather, cannot land." if weather.stormy?
  end

  def take_off_checks(airport, weather)
    raise "Not in the airport." unless airport.landed_planes.include? self
    raise "Stormy weather, cannot take off." if weather.stormy?
  end
end
