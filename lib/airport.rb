require 'weather'

class Airport
  attr_reader :planes, :capacity

  def initialize(capacity)
    @capacity = capacity
    @planes = []
  end

  def instruct_landing(plane)
    raise 'Cannot land. Airport is full' if full?
    raise 'Cannot land due to stormy weather' if stormy?
    @planes << plane
  end

  def instruct_take_off(plane)
    raise 'Cannot take off due to stormy weather' if stormy?
  end

  private

  def full?
    @planes.size >= @capacity
  end

  def stormy?
    rand(1..6) > 4
  end
end
