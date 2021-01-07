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
    raise 'Cannot take off: Weather stormy' if stormy?
    @planes.pop
  end

  private
  def full?
    @planes.length >= @capacity
  end

  def stormy?
    rand(1..6) > 4
  end
end