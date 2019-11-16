require_relative 'Plane'

class Airport
  attr_accessor :planes
  attr_accessor :weather

  def initialize
    @planes = []
  end

  DEFAULT_CAPACITY = 20

  def weather
    rand(5)
  end

  def check_to_land
    if weather == 1
      raise "Weather is stormy, cannot land"
      false
    else
      land(Plane.new)
    end
  end

  def check_to_take_off
    if weather == 1
      raise "Weather is stormy, cannot take off"
      false
    else
      take_off
    end
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
