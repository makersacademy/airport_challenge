require_relative "plane"

class Airport
  
  attr_accessor :capacity, :planes, :name

  DEFAULT_CAPACITY = 10

  def initialize(name, capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
    @name = name
  end

  def takeoff(plane)
    if plane.location == "in air"
      raise("Plane is already in air")
    elsif stormy?
      raise("Weather is stormy! Do not takeoff")
    else
      plane.change_location("in air")
      planes.delete(plane)
    end
  end

  def land(plane)
    if plane.location.is_a? Airport
      raise("Plane is already in #{@name}")
    elsif full?
      raise("No space in airport! Do not land")
    elsif stormy?
      raise("Weather is stormy! Do not land")
    else
      plane.change_location(self)
      planes.push(plane)
    end
  end

  def weather_generator
    weather = ["sunny", "cloudy", "stormy", "light rain"]
    weather[rand(0..3)]
  end

  def stormy?
    return true if weather_generator == "stormy"
  end

  def full?
    return true if planes.length == capacity
  end

end
