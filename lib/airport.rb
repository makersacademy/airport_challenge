require_relative 'plane.rb'

class Airport
  attr_reader :hangar, :capacity
  HANGAR_CAPACITY = 50

  def initialize(capacity = HANGAR_CAPACITY)
    @hangar = []
    @capacity = capacity
  end

  def land(plane)
    raise RuntimeError, "Cannot land plane, Airport is full" if full?
    raise RuntimeError, 'It is stormy cannot land' if stormy?
    raise RuntimeError, 'Plane is currently landed' if plane.landed == true

    @hangar << plane
  end

  def take_off(plane)
    raise RuntimeError, 'It is stormy cannot takeoff' if stormy?
    raise RuntimeError, 'Plane is currently flying, cannot take off' if plane.flying == true

    @hangar.pop
  end

  def stormy?(weather_prediction = rand(1..5))
    weather_prediction == 5 
  end 

  private
  def full? 
    @hangar.size >= @capacity
  end
end
