require 'byebug'
require_relative 'weather'

class Airport

  DEFAULT_CAPACITY = 20

  attr_reader :planes, :capacity, :weather, :flying

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
    @flying = false
    @weather = Weather.new
  end

  def land(plane)
    check_capacity
    check_weather
    fail "This plane is already in this airport" if in_airport?(plane)
    @planes << plane
    flying = false
    "Plane landed at airport"
  end

  def take_off(plane)
    is_flying #Check if plane is currently flying
    fail "This plane is not in this airport" if !in_airport?(plane)
    check_weather
    @flying = true
    @planes.pop
    "Plane has taken off from airport"
  end
    
  def is_flying
    fail "This plane is currently flying" if @flying == true
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
