require_relative 'plane'

class Airport
  attr_reader :planes, :capacity
  DEFAULT_CAPACITY = 6

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def land(plane)
    raise 'airport is full' if full?
    raise 'too stormy to land' if stormy?
    plane.landed
    @planes.push(plane)
  end

  def take_off(plane)
    raise 'no planes to take off' if empty?
    raise 'too stormy to take off' if stormy?
    plane.taking_off
    @planes.delete(plane)
  end

  def stormy?
    rand(1..6) == 6
  end

  private
  def empty?
    @planes.empty?
  end

  def full?
    @planes.length >= @capacity
  end

end
