require_relative 'plane'

class Airport

  DEFAULT_CAPACITY = 30
  attr_accessor :capacity, :planes, :weather, :stormy

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
  end

  def land(plane)
    raise "There is no space" if full?
    raise "Weather is stormy. Couldn't land" if stormy?
    planes << plane
    return "#{plane} has landed"
  end

  def takeoff(plane)
    raise "Weather is stormy. Couldn't take off" if stormy?
    index = planes.index(plane)
    return "#{planes.slice!(index)} is up in the air"
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
