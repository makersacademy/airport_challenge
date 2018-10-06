require 'pry'

class Airport

  attr_reader :capacity

  DEFAULT_CAPACITY = 10

  attr_reader :planes

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def receive(plane)
    raise "Airport is closed" if Weather.stormy? == true || full?
    @planes << plane
  end

  def sendoff(plane)
    raise "Airport is closed" if Weather.stormy? == true
    @planes.delete(plane)
  end

  def full?
    true if @planes.count >= @capacity
  end

end
