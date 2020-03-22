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
    fail "Bad weather" if stormy?

    @planes << Plane.new
    @planes.last
  end

  def take_off
    fail "Bad weather" if stormy?

    @planes.pop
  end

  def view_planes
    @planes
  end

  def stormy?
    rand(5) > 1
  end

end
