require_relative 'plane'


class Airport

  def initialize
    @planes = []

  end

  def land(plane)
    @planes << plane
  end

  def takeoff
    fail 'Cannot takeoff, the weather is stormy' if stormy?
    @planes.pop
  end

  def any_planes?
    @planes ||= []
  end

  private

  def stormy?
    true
  end

end
