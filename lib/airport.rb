require_relative 'plane'

class Airport

  DEFAULT_CAPACITY = 1

  attr_reader :capacity, :planes, :location, :stormy

  def initialize(capacity=DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
    @location = self.object_id
  end

  def full?
    true if @planes.count >= @capacity
  end

  def stormy?
    rand(1..100) >= 90
  end

end
