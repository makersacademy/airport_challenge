require_relative './plane'

class Airport

  DEFAULT_CAPACITY = 20
  attr_accessor :capacity 

  def initialize
    @planes = []
    @capacity = DEFAULT_CAPACITY
  end

  def land(plane)
    fail 'cannot land as the airport is full' if full?
    fail 'cannot land due to stormy conditions' if stormy?
    @planes << plane
  end

  def take_off
    fail 'cannot take off due to stormy conditions' if stormy?
    @planes.pop
    @planes
  end

private

  def stormy?
    rand(10) == 9
  end

  def full?
    @planes.length == DEFAULT_CAPACITY
  end

end
