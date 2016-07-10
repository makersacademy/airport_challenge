require_relative 'plane'

class Airport

  def initialize(capacity)
    @capacity = capacity
    @planes = []
  end


  def land(plane)
    raise "Cannot land plane as airport is full" if full?
    @planes << plane
  end

  def plane
    @planes
  end

  def take_off(plane)
    @planes.pop
  end

  private

  def full?
    @planes.length >= @capacity
  end

end
