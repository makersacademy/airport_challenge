require_relative 'weather'
class Airport
  include Weather
  DEFAULT_CAPACITY = 10
  attr_reader :planes, :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    raise ArgumentError.new("Please enter a positive integer") unless valid_capacity?(capacity)
    @planes = []
    @capacity = capacity
  end
  
  def land(plane = nil)
    plane_check(plane)
    fail "Plane already in airport" if in_airport?(plane)
    fail "Airport full" if full?
    fail "Weather conditions aren't stable" if stormy?
    
    @planes << plane
  end

  def take_off(plane = nil)
    plane_check(plane)
    fail "Plane not in airport" unless in_airport?(plane)
    fail "Weather conditions aren't stable" if stormy?

    @planes.delete(plane)
    return "Plane has taken off"
  end

  private

  def in_airport?(new_plane)
    @planes.any? { |plane| plane.id == new_plane.id }
  end

  def plane_check(plane)
    raise ArgumentError.new("Plane not given") unless plane.is_a?(Plane)
  end

  def valid_capacity?(capacity)
    capacity.is_a?(Integer) && capacity.positive?
  end

  def full?
    @planes.count >= @capacity
  end

  def stormy?
    check_weather == :stormy
  end
end
