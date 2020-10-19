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
    raise("Plane is already in air") if plane.location == "in air"

    raise("Plane is not in this airport") if plane.location != self

    raise("Weather is stormy! Do not takeoff") if stormy?

    plane.change_location("in air")
    planes.delete(plane)

  end

  def land(plane)
    raise("Plane is already in #{plane.location.name}") if plane.location.is_a?(Airport)

    raise("No space in airport! Do not land") if full?

    raise("Weather is stormy! Do not land") if stormy?

    plane.change_location(self)
    planes.push(plane)

  end

  private

  def weather_generator
    weather = ["sunny", "cloudy", "stormy", "light rain"]
    weather.sample
  end

  def stormy?
    weather_generator == "stormy"
  end

  def full?
    planes.length == capacity
  end

end
