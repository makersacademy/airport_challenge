require './lib/plane.rb'
class Airport
  attr_reader :hangar, :capacity
  DEFAULT_CAPACITY = 50

  def initialize(capacity=DEFAULT_CAPACITY)
    @hangar = [Plane.new]
    @capacity = capacity
  end
  
  def random_weather
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