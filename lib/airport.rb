require_relative 'plane.rb'
require_relative 'weather.rb'

class Airport
  attr_reader :planes, :weather, :capacity

  DEFAULT_CAPACITY = 50

  def initialize(weather = Weather.new)
    @planes = []
    @weather = weather
    @capacity = DEFAULT_CAPACITY
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
