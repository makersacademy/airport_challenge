require_relative 'plane'

class Airport
  attr_reader :planes, :capacity
  DEF_CAPACITY = 100

  def initialize(capacity = DEF_CAPACITY)
    @capacity = capacity
    @planes = []
  end

  def land(plane)
      raise 'Stormy Weather' if stormy?
      raise 'Airport Full' if full?
      @planes << plane
      @planes[0]
  end

  def take_off(plane)
    raise 'Stormy Weather' if stormy?
    @planes.pop
  end

  def stormy?
    rand(2) == 1 ? true : false
  end

  def full?
    @planes.count >= @capacity
  end

end
