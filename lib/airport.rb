require_relative 'plane.rb'
require_relative 'weather.rb'

class Airport
  attr_reader :planes, :weather, :capacity

  DEFAULT_CAPACITY = 50

  def initialize(capacity = DEFAULT_CAPACITY)
    fail 'invalid capacity' if capacity <= 0
    @planes = []
    @weather = Weather.new
    @capacity = capacity
  end

  def land(plane)
    raise 'cannot land in stormy weather' if stormy?
    raise 'airport full' if full?
    plane.land
    @planes << plane
  end

  def takeoff(plane)
    raise 'cannot takeoff in stormy weather' if stormy?
    raise 'no planes to takeoff' if empty?
    plane.takeoff
    @planes -= [plane]
  end

  def in_airport?(plane)
    @planes.include?(plane)
  end

  def adjust_capacity(capacity)
    raise 'invalid capacity' if capacity <= 0
    raise 'planes exceeed that capacity!' if @planes.length > capacity
    @capacity = capacity
  end

  private

  def full?
    @planes.length >= @capacity
  end

  def stormy?
    @weather.stormy?
  end

  def empty?
    @planes.empty?
  end
end
