require './lib/plane.rb'
class Airport
  attr_reader :planes, :capacity, :where

  CAPACITY = 1

  def initialize(capacity=CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def land(plane)
    raise "Cannot land, capacity full" if full?
    raise "Cannot land, weather is stormy" if stormy?
    plane.log(self)
    @planes << plane
  end

  def take_off(plane)
    fail "Cannot take off, weather is stormy" if stormy?
    fail "No planes to take off" if planes.empty?
    fail 'this plane not at this airport' if  !plane_logged?(plane)
    plane.unlog
    @planes.delete(plane)
  end

  private

  def full?
    @planes.count == @capacity
  end

  def weather_stormy?
    weather = ["sunny", "cold", "fog", "raining", "stormy"]
    index=rand(4)
    weather[index] == "stormy"? true : false
  end

  def stormy?
    weather_stormy?
  end

  def plane_logged?(plane)
    @planes.include? plane
  end

end
