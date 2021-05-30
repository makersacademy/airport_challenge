require_relative 'plane'

class Airport
  attr_reader :planes, :capacity
  DEFAULT_CAPACITY = 6

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def land(plane)
    raise 'airport is full' if @planes.length >= @capacity
    plane.landed
    @planes.push(plane)
  end

  def take_off(plane)
    raise 'no planes to take off' if @planes.empty?
    plane.taking_off
    @planes.delete(plane)
  end

  private
  def empty?
    @planes.empty?
  end
end
