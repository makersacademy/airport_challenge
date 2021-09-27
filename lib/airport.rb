require_relative 'weather'
class Airport
  include Weather
  
  DEFAULT_CAPACITY = 10
  
  attr_reader :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    raise ArgumentError.new("Please enter a positive integer") unless valid_capacity?(capacity)
    
    @planes = []
    @capacity = capacity
  end
  
  def land(plane = nil)
    fail "Weather conditions aren't stable" if stormy?
    
    plane_check(plane)
    fail "Plane already in airport" if at_airport?(plane)
    fail "Airport full" if full?
    
    @planes << plane
    self
  end

  def take_off(plane = nil)
    fail "Weather conditions aren't stable" if stormy?
    
    plane_check(plane)
    fail "Plane not in airport" unless at_airport?(plane)
    
    @planes.delete(plane)
    self
  end

  def at_airport?(new_plane)
    @planes.any? { |plane| plane.id == new_plane.id }
  end

  private

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
