require_relative './plane'
require_relative './weather'


class Airport
  attr_accessor :plane
  attr_reader :planes_in_airport
  def initialize
    @plane = Plane.new
    @weather = Weather.new
    @planes_in_airport = []
  end

  def land(plane) 
    raise Exception.new("No landings permitted") if stormy
    @planes_in_airport << plane
  end

  def take_off(plane)
    raise Exception.new("No take offs permitted") if stormy
    @planes_in_airport.delete(plane)
  end

  def plane_left?
    true
  end

  def stormy
    @weather.stormy?
  end
end