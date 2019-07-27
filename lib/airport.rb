require_relative 'plane'

class Airport

attr_reader :capacity
DEFAULT_CAPACITY = 50

  def initialize(capacity = DEFAULT_CAPACITY)
    @plane_list = []
    @capacity = capacity
  end

  def take_off(plane)
    raise "The plane can't take off with the stormy weather"  if random_weather == "stormy"
    @plane_list -= [plane]
    plane.flying
    "The plane took off" if plane.flying? == true
  end

  def land(plane)
    raise "The plane can't land with the stormy weather" if random_weather == "stormy"
    raise "The airport is full" if full?
    plane.landed
    @plane_list << plane
  end

  def random_weather
    ["sunny", "stormy", "rainy", "cloudy"].sample
  end

private

  def full?
    @plane_list.count >= DEFAULT_CAPACITY
  end

end
