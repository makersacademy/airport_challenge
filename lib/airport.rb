require_relative 'plane'

class Airport
  DEFAULT_CAPACITY = 1
  attr_reader :planes, :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
   @planes = []
   @capacity = capacity
  end

  def land(plane)
    fail 'plane is already in airport' if exists?(plane)
    fail 'plane cannot take land in a storm' if stormy?
    fail 'Airport is full and cannot land' if full?
    @planes << plane
    plane.landing
  end

  def take_off(plane)
    fail 'plane cannot take off from somewhere it hasnt landed' unless exists?(plane)
    fail 'plane cannot take off in a storm' if stormy?
    @planes.delete(plane)
    plane.taking_off
  end

  private

  def stormy?
    rand > 0.9
  end

  def full?
    return true if @planes.size >= @capacity
  end

  def exists?(plane)
    @planes.include?(plane)
  end
end
