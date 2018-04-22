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
    fail 'plane already landed' unless flying?(plane)
    fail 'cannot land due to stormy conditions' if stormy?
    plane.land
    @planes << plane
  end

  def take_off(plane)
    fail 'no planes at airport' if empty?
    fail 'plane already flying' if flying?(plane)
    fail 'cannot take off due to stormy conditions' if stormy?
    plane.take_off
    @planes.delete(plane)
    @planes
  end

private

  def stormy?
    rand(10) == 9
  end

  def full?
    @planes.length == DEFAULT_CAPACITY
  end

  def empty?
    @planes.empty?
  end

  def flying?(plane)
    plane.flying?
  end

end
