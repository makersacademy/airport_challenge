class Plane
  attr_reader :location

  def initialize
    @location = "sky"
  end

  def land(airport)
    landing_checks(airport)
    airport.landed_planes << self
    @location = "airport"
  end

  def take_off(airport)
    take_off_checks(airport)
    airport.landed_planes.delete(self)
    @location = "sky"
  end

  private

  def landing_checks(airport)
    raise "Airport is full!" if airport.landed_planes.count >= airport.capacity
    raise "Already in the airport." if airport.landed_planes.include? self
    raise "Already in a different airport." if @location == "airport"
    raise "Stormy weather, cannot land." if airport.weather == "stormy"
  end

  def take_off_checks(airport)
    raise "Not in the airport." unless airport.landed_planes.include? self
    raise "Stormy weather, cannot take off." if airport.weather == "stormy"
  end
end
