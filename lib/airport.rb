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
    plane.flying?
    "The plane took off" if plane.flying? == false
  end

  def land(plane)
    raise "The plane can't land with the stormy weather" if random_weather == "stormy"
    raise "The airport is full" if full?
    plane.landed?
    # "Plane can't land is already in the airport"
    @plane_list << plane
  end

private

  def random_weather
    ["sunny", "stormy", "rainy", "cloudy"].sample
  end

  def full?
    @plane_list.count >= DEFAULT_CAPACITY
  end

end
