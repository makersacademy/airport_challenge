require_relative 'plane'
require_relative 'weather'

class Airport

  attr_reader :planes
  attr_accessor :capacity

  def initialize
    @planes = []
    @capacity = 25
  end

  def land(plane)
    fail "Airport is full" if @planes.count >= @capacity
    @planes << plane
  end

  def take_off
    @planes.pop
  end

end
