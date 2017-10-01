require_relative './weather'

class Airport

  attr_accessor :weather, :planes, :capacity

  DEFAULT_CAPACITY = 10

  def initialize(capacity = DEFAULT_CAPACITY)
    @weather = Weather.new
    @planes = []
    @capacity = capacity
  end

  def land(plane)
    raise 'cannot land at full airport' if full?
    @planes << plane
  end

  def take_off(plane)
    @planes.delete(plane)
  end

  def clear?
    @weather.set
    !@weather.stormy
  end

  def full?
    @planes.count >= @capacity
  end

  def here?
    planes.include?(@plane)
  end

end