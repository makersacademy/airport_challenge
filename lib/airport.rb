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
    @aerodrome << plane
  end

  def release(plane)
    @aerodrome.delete(plane)
  end

  private
  
  def full?
    aerodrome.size >= @capacity
  end
end
