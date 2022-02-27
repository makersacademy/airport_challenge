require 'plane'

class Airport
  attr_accessor :aerodrome

  DEFAULT_CAPACITY = 1

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @aerodrome = []
  end

  def receive(plane)
    raise "airport is full" if full?
    raise "plane cannot land, the weather is stormy" if weather == "stormy"
    @aerodrome << plane
  end

  def release(plane)
    raise "plane cannot take off, the weather is stormy" if weather == "stormy"
    @aerodrome.delete(plane)
  end

  private
  
  def full?
    aerodrome.size >= @capacity
  end

  def weather
    num = rand(1...10)
    num == 1 ? "stormy" : "sunny"
  end
end
