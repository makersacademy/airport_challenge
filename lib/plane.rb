require_relative "airport_container"

class Plane
  include AirportContainer

  attr_reader :planes, :capacity
  
  def initialize
    @capacity = DEFAULT_CAPACITY
    @planes = []
  end

  def land(plane)
    raise "Weather is stormy, plane cannot land" if @weather == "stormy"
    raise "Airport full, plane cannot land" if full? == true
    @planes.push(plane)
  end
  
  def take_off(plane)
    raise "Weather is stormy, plane cannot take off" if @weather == "stormy"
    if @planes.delete(plane) == true
      plane.flying
    end
    raise "Plane did not take off" if @planes.include?(plane)
  end

  def full?
    @planes.size >= @capacity
  end

  def weather_conditions
    @weather = Random.rand(20)
    @weather > 15 ? @weather = "stormy" : @weather = "sunny"
  end

  def flying
    @flying = true
  end
end
