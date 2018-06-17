require_relative 'plane'

class Airport

  DEFAULT_CAPACITY = 10

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
  end

  def land(plane)
    raise 'Stormy weather' if stormy?
    raise 'At capacity' if @planes.length >= @capacity
    @planes << plane
  end

  attr_reader :plane
  attr_reader :capacity

  def take_off(plane)
    raise 'Stormy weather' if stormy?
    raise 'Error: plane not at airport' unless @planes.include?(plane)
    plane
  end

  def stormy?
    rand(1..10) > 8
  end

end
