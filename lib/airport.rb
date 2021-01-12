require_relative 'plane'
require_relative 'weather'
class Airport

  attr_reader :planes
  attr_accessor :capacity

  DEFAULT_CAPACITY = 100

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def land(plane)
    check_landing_possible(plane)
    planes << plane
  end

  def takeoff
    check_takeoff_possible
    planes.pop
  end

  def stormy?
    Weather.new.stormy?
  end

private

  def full?
    planes.length >= capacity
  end

  def empty?
    planes.empty?
  end

  def includes?(plane)
    planes.include?(plane)
  end

  def check_landing_possible(plane)
    raise "Airport is full" if full?

    raise "Plane has already landed" if includes?(plane)

    raise "It is too stormy to land" if stormy?
  end

  def check_takeoff_possible
    raise "There are no planes" if empty?

    raise "It is too stormy to takeoff" if stormy?
  end

end
