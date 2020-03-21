require_relative 'plane'

class Airport

  attr_reader :planes
  DEFAULT_CAPACITY = 1

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def land
    fail "Airport Full" if @planes.length >= @capacity

    @planes << Plane.new
    @planes.last
  end

  def take_off
    @planes.pop
  end

  def view_planes
    @planes
  end

  def stormy?
  
  end

end
