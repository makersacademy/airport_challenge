require_relative './weather'

class Airport

  attr_accessor :weather, :planes, :capacity

  DEFAULT_CAPACITY = 10

  def initialize(capacity = DEFAULT_CAPACITY)
    @weather = Weather.new
    @planes = []
    @capacity = capacity
  end

  def clear?
    @weather.randomize
    !@weather.stormy
  end

  def full?
    @planes.count >= @capacity
  end

end