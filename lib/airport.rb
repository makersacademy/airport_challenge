require_relative 'plane'

class Airport

  attr_reader :planes
  attr_reader :storm
  DEFAULT_CAPACITY = 1

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def land
    fail "Airport Full" if @planes.length >= @capacity
    fail "Bad weather" if @storm

    @planes << Plane.new
    @planes.last
  end

  def take_off
    fail "Bad weather" if @storm
    
    @planes.pop
  end

  def view_planes
    @planes
  end

  def stormy
    @storm = true
  end
end
