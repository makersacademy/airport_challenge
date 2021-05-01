require './lib/plane.rb'
require './lib/weather.rb'
class Airport
  attr_reader :hangar, :capacity, :weather
  DEFAULT_CAPACITY = 50

  def initialize(capacity=DEFAULT_CAPACITY)
    @hangar = [Plane.new]
    @capacity = capacity
  end
  
  def get_weather(weather=Weather.get_current)
    @weather = weather
  end

  def full?
    @hangar.length >= @capacity
  end

  def plane_in_airport?(plane)
    hangar.include?(plane)
  end

  def land(plane)
    raise 'Hangar is full!' if full?
    raise 'Plane already landed!' if !plane.flying
    plane.landed
    @hangar << plane 
  end

  def take_off(plane)
    raise 'Plane not found in airport!' if !plane_in_airport?(plane)
    @hangar.delete(plane)
    plane.is_flying
  end
end