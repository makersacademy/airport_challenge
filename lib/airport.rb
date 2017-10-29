require_relative "plane"
require_relative "weather"
class Airport

  DEFAULT_CAPACITY = 50

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes= []
    @capacity = capacity
  end

  attr_reader :planes, :capacity

  def land(plane)
    raise "Airport is full" if full?
    raise "It's stormy! You can't land right now" if stormy?
    @planes << plane
  end

  def take_off(plane)
      raise "It's stormy! We can't fly" if stormy?
      @planes.pop
  end

  def stormy?
     Weather::report
  end

  def full?
    @planes.length >= @capacity
  end
end
