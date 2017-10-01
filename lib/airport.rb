require_relative 'plane'
require_relative 'weather'

class Airport

  attr_reader :planes, :capacity

  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def land(plane)
    raise "Airport full" if @planes.length >= @capacity
    raise "Plane is grounded" if !plane.flying
    plane.ground
    @planes << plane
  end

  def take_off(plane)
    raise "Plane not in airport" if !at_airport?(plane)
    raise "Cannot take-off during a storm" if stormy?
    plane.fly
    puts "Plane has departed" if !at_airport? @planes.delete(plane)
  end

  def at_airport?(plane)
    @planes.include?(plane)
  end

  private

  def stormy?
    Weather.new.stormy?
  end

end
