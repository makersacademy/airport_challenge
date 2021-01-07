#require './lib/plane.rb'

class Airport 
  attr_reader :planes
  attr_accessor :capacity
  
  DEFAULT_CAPACITY = 20

  def initialize(capacity=DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
  end

  def land(plane)
    raise 'Airport cannot accept more planes: Full' if full?
    @planes << plane
  end

  def take_off(plane)
    @planes.pop
  end

  def full?
    @planes.length >= @capacity
  end
end