require_relative 'plane'

class Airport

  def initialize(capacity)
    @capacity = capacity
    @planes = []
  end


  def land(plane)
    raise "Cannot land plane as airport is full" if full?
    raise "Cannot land plane as it is stormy" if stormy?
    @planes << plane
  end

  def plane
    @planes
  end

  def take_off(plane)
    raise "Cannot take off as it is stormy" if stormy?
    @planes.pop
  end

  private

  def full?
    @planes.length >= @capacity
  end

  def stormy?
    rand(1..10) > 8
  end

end
