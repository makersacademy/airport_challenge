require './lib/plane'

class Airport

  DEFAULT_AIRPORT_CAPACITY = 10

  attr_reader :planes

  def initialize
    @planes = []
  end

  def land(plane)
    raise "Airport is full" if @planes.size >= DEFAULT_AIRPORT_CAPACITY
    @planes << plane
  end

  def take_off(plane)
    @planes[1..-1]
  end
end
