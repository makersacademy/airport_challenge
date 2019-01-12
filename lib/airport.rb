require_relative './plane'
require_relative './weather'


class Airport
  attr_reader :planes_in_airport
  attr_reader :capacity

  DEFAULT_CAPACITY = 1

  def initialize(capacity = DEFAULT_CAPACITY)
    @plane = Plane.new
    @weather = Weather.new
    @planes_in_airport = []
    @capacity = capacity
  end

  def land(plane) 
    raise Exception.new("No landings permitted") if stormy || capacity_reached?
    @planes_in_airport << plane
  end

  def take_off(plane)
    unless plane_exists?(plane) raise Exception.new("This plane doesn't exist in the airport") end
    raise Exception.new("No take offs permitted") if stormy
    @planes_in_airport.delete(plane)
  end

  def capacity_reached?
    @planes_in_airport.length >= @capacity
  end

  def plane_exists?(plane)
    planes_in_airport.include?(plane)
  end

  def stormy
    @weather.stormy?
  end
end