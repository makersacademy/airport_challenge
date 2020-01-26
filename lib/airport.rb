require_relative 'plane'
class Airport
  attr_reader :planes, :capacity
  
  DEFAULT_CAPACITY = 10

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def land(plane)
    raise "Cannot land while weather is stormy" if stormy?
    raise "Plane capacity is full" if full?
    @planes << plane
  end

  def take_off
    if planes.length > 0
    raise "Cannot take off while weather is stormy" if stormy?
    @planes.pop
    else
      raise "There are no planes"
    end
  end

  def full?
    @planes.length >= @capacity
  end

  def stormy?
    rand(1..10) > 7
  end

end