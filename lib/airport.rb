class Airport
  require 'weather'
  require 'plane'
  include Weather

  attr_reader :planes, :capacity

  def initialize(capacity = 20)
    @planes = []
    @capacity = capacity
  end

  def land(plane)
    fail "Airport is full" if full?
    fail "Weather is too stormy for landing" if weatherbad?
    plane.in_flight = false 
    @planes << plane
    plane
  end

  def takeoff
    fail "Airport is empty" if empty?
    fail "Weather is too stormy for take off" if weatherbad?
    plane = @planes[0]
    plane.in_flight = true
    @planes.shift
    plane
  end 

  private

  def full?
    planes.count >= @capacity
  end

  def empty?
    @planes.empty?
  end
end
