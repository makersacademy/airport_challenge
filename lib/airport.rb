require 'pry'

class Airport

  attr_reader :capacity

  DEFAULT_CAPACITY = 10

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def planes
    @planes
  end

  def receive(plane)
    raise "Airport is closed" if Weather.stormy? == true || full?
    @planes << plane
  end

  def sendoff(plane)
    # binding.pry
    raise "Airport is closed" if Weather.stormy? == true
    # binding.pry
    @planes.delete(plane)
    # binding.pry
  end

  def full?
    true if @planes.count >= @capacity
  end

end
