require 'byebug'
require_relative 'weather'
require_relative 'plane'

class Airport

  DEFAULT_CAPACITY = 20

  attr_reader :planes, :capacity, :weather, :is_flying

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
    @weather = Weather.new
  end

  def land(plane)
    check_capacity
    check_weather
    fail "This plane is already in this airport" if in_airport?(plane)
    @planes << plane
    plane.landed
    "Plane landed at airport"
  end

  def take_off(plane)
    flying?(plane) 
    fail "This plane is not in this airport" unless in_airport?(plane)
    check_weather
    @planes.pop
    plane.in_air
    "Plane has taken off from airport"
  end
    
  def flying?(plane)
    fail "This plane is currently flying" if plane.is_flying
  end

  def in_airport?(plane)
    @planes.include?(plane)
  end

  def check_capacity
    fail "Airport is full" if full?
  end

  def check_weather
    fail "Cannot proceed due to storm" if weather.stormy?
  end

  def full?
    @planes.count >= @capacity
  end
end
