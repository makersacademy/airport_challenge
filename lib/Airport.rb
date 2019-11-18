require_relative 'Plane'

class Airport
  attr_accessor :planes
  attr_reader :weather

  def initialize(weather = Weather.new)
    @planes = []
    @weather = weather
  end

  DEFAULT_CAPACITY = 20

  def check_to_land
    raise "Weather is stormy, cannot land" if weather.stormy?
    land(Plane.new)
  end

  def check_to_take_off
    raise "Plane not functioning" if plane.working? == false
    raise "Weather is stormy, cannot take off" if weather.stormy?
    take_off
  end

  def land(plane)
    raise "Airport full" if @planes.length >= DEFAULT_CAPACITY
    raise "Not a plane" unless plane.is_a? Plane
    @planes << plane
    "Plane has landed"
  end

  def take_off
    @planes.pop
    "Plane has left the airport"
  end

end
