require_relative './weather'
require_relative './plane'

class Airport
  attr_reader :weather, :airport

  DEFAULT_CAPACITY = 10

  def initialize
    @airport = []
    @capacity = DEFAULT_CAPACITY
    @weather = Weather.new
  end

  def full?
    @airport.count == @capacity
  end

  def land(plane)
    raise "Can't land in stormy weather" if @weather.stormy?
    raise "Airport full, can't land" if full?

    @airport << plane
  end

  def takeoff
    raise "Can't take off in stormy weather" if @weather.stormy?

    @airport.pop
  end

end
