require_relative 'plane.rb'
class Airport
  attr_reader :airport, :capacity
  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @airport = []
    @capacity = capacity
  end

  def land(plane)
    fail 'Airport is currently full' if full?

    fail 'Cannot land due to stormy weather' if stormy?

    @airport.push(plane)
  end

  def take_off
    fail 'Cannot take off due to stormy weather' if stormy?

    print 'The plane has left the airport'

    @airport.pop
  end

private

  def full?
    @airport.count >= @capacity
  end

  def stormy?
    [true, false, false, false, false].sample
  end
end
