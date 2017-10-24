$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'plane'
require 'weather'

class Airport

  attr_reader :planes, :capacity

  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    raise "Capacity must be greater than 1" if capacity < 1
    @planes = []
    @capacity = capacity
  end

  def land(plane)
    raise "Airport full" if full?
    raise "Plane is grounded" unless plane.flying?
    plane.ground
    @planes << plane
  end

  def full?
    @planes.length >= @capacity
  end

  def take_off(plane)
    raise "Plane not in airport" unless at_airport?(plane)
    raise "Cannot take-off during a storm" if stormy?
    plane.fly
    puts "Plane has departed" unless at_airport? @planes.delete(plane)
  end

  def at_airport?(plane)
    @planes.include?(plane)
  end

  private

  def stormy?
    Weather.new.stormy?
  end

end
