require_relative 'plane'
require_relative 'weather'

class Airport

  DEFAULT_CAPACITY = 30
  attr_accessor :capacity, :planes, :weather, :stormy

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
  end

  def land(plane)
    fail "There is no space" if full?
    fail "Stormy weather!" if stormy?
    planes << plane
    "#{plane} has landed"
  end

  def takeoff(plane)
    fail "Stormy weather!" if stormy?
    fail "Plane not found!" unless planes.include?(plane)
    index = planes.index(plane)
    plane
  end

  private

  def empty?
    planes == []
  end

  def full?
    planes.length >= capacity
  end

  def stormy?
    Weather.new.stormy?
  end

end
