require 'plane'

class Airport
  attr_accessor :aerodrome, :capacity

  DEFAULT_CAPACITY = 1

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @aerodrome = []
    @weather = rand(1...10) == 1 ? "stormy" : "sunny"
  end

  def receive(plane)
    raise "airport is full" if full?
    raise "plane cannot land, the weather is stormy" if stormy?
    @aerodrome << plane
  end

  def release(plane)
    raise "plane cannot take off, the weather is stormy" if stormy?
    @aerodrome.delete(plane)
  end

  def stormy?
    @weather == "stormy"
  end

  private
  
  def full?
    aerodrome.size >= @capacity
  end
end
