require_relative 'plane'

class Airport

  def initialize
    @planes = []
  end

  def land(plane)
    raise 'Stormy weather' if stormy?
    @planes << plane
  end

  attr_reader :plane

  def take_off(plane)
    raise 'Stormy weather' if stormy?
  end

  def stormy?
    rand(1..10) > 8
  end

end
