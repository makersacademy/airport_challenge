require_relative "airport_container"

class Plane
  include AirportContainer

  attr_reader :planes
  attr_reader :capacity
  
  def initialize
    @planes = []
    @capacity = DEFAULT_CAPACITY
  end

  def land(plane)
    raise "Airport full, plane cannot land" if full?
    @planes << plane
    raise "Weather is stormy, plane cannot land" if @weather == :stormy
  end
  
  def take_off(plane)
    @planes.pop
    raise "Plane did not take off" if @planes.include?(plane)
    raise "Weather is stormy, plane cannot land" if @weather == "stormy"
  end

  def full?
    @planes.size >= @capacity
  end

  def weather_conditions
    @weather = [:stormy, :sunny]
    @weather[Random.rand(@weather.length)]
  end
end
