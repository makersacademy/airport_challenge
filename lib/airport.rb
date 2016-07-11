require_relative 'plane'

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
    index = planes.index(plane)
    "#{planes.slice!(index)} is up in the air"
  end

  private

  def empty?
    planes == []
  end

  def full?
    planes.length >= capacity
  end

  def stormy?
    rand(1..10) >= 3
  end


end
