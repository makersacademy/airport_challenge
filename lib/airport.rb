require_relative 'plane.rb'

class Airport
attr_reader :hangar, :capacity
HANGAR_CAPACITY = 50

  def initialize(capacity = HANGAR_CAPACITY)
    @hangar = []
    @capacity = capacity
  end

  def land(plane)
    if full?
      raise RuntimeError, "Cannot land plane, Airport is full" 
    elsif stormy?
      raise RuntimeError, 'It is stormy cannot land'
    elsif plane.landed == true
      raise RuntimeError, 'Plane is currently landed'
    else
      @hangar << plane
    end
  end

  def take_off
    raise RuntimeError, 'It is stormy cannot takeoff' if stormy?
    @hangar.pop
  end

  
  def stormy?(weather_prediction = rand(1..5))
    if weather_prediction == 5 
      true
    else 
      false
    end
  end 

  private
  def full? 
    @hangar.size >= @capacity ? true : false
  end
end