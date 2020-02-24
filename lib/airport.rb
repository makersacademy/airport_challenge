require_relative 'plane.rb'
require_relative 'weather.rb'
class Airport
  attr_reader :airport, :capacity, :weather
  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY, weather = Weather.new)
    @airport = []
    @capacity = capacity
    @weather = weather
  end

  def land(plane)
    fail 'Airport is currently full' if full?

    fail 'Cannot land due to stormy weather' if weather.stormy?

    @airport.push(plane)
  end

  def take_off
    fail 'Cannot take off due to stormy weather' if weather.stormy?

    @airport.pop
    print 'The plane has left the airport'

  end

private

  def full?
    @airport.count >= @capacity
  end
end
