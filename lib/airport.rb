require_relative 'plane'
require_relative 'weather'
class Airport
  DEFAULT_CAPACITY = 200
  attr_reader :landed, :capacity, :weather

  def initialize(weather, capacity=DEFAULT_CAPACITY)
    @weather = weather
    @capacity = capacity
    @landed = []
  end

  def land(plane)
    raise "Impossible to allow landing, weather is stormy!" if stormy?
    raise "The airport is full at the moment, please wait for landing." if full?
    #plane.land
    @landed << plane
    "The plane has already landed"
  end

  def take_off(plane)
    raise "Impossible to allow take off, weather is stormy!" if stormy?
    raise "Planes can't take off from airports they aren't in" unless @landed.include?(plane)
    #@landed.pop
    "The plane has taken off and it is no longer in the airport"
  end

  def full?
    @landed.count >= @capacity
  end

  def stormy?
    @weather.stormy?
  end

end
