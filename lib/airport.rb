require_relative 'airplane'
require_relative 'weather'

class Airport

  attr_reader :planes

  DEFAULT_CAPACITY = 20

  def initialize(weather = Weather.new, capacity = DEFAULT_CAPACITY)
    @weather = weather
    @airport = []
    @capacity = capacity
  end

  def land(plane)
    raise "No planes can land, stormy weather." if @weather.stormy
    raise "No more planes can land, airport full." if full?

    @airport << plane
  end

  def takeoff
    raise "No planes can take off, stormy weather." if @weather.stormy?
    
    @airport.pop
  end

  def full?
    @capacity == @airport.count
  end

end
