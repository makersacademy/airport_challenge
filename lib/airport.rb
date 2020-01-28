require_relative 'plane'

class Airport

  def initialize(capacity = 20)
    @capacity = capacity
    @planes = []
  end

  def land(plane)
    raise 'cannot land when airport full' if full?
    raise 'cannot land plane when stormy' if stormy?
    @planes << plane
end

  def take_off(plane)
  end

  private
  def full?
    @planes.length >= @capacity
  end

  def stormy?
    rand(1..5) > 3
  end
end
