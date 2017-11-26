require_relative "plane"
require_relative "weather"

class Airport
  DEFAULT_CAPACITY = 10
  attr_reader :hangar
  attr_accessor :capacity

  def initialize
    @hangar = []
    @capacity = DEFAULT_CAPACITY
    @weather = Weather.new
  end

  def land(plane)
    fail "Plane already landed" if @hangar.include?(plane)
    fail "Airport at full capacity, plane unable to land" if full?
    fail "Stormy weather, plane unable to land" if stormy?
    @hangar << plane
    "Plane has landed"
  end

  def take_off(plane)
    fail "Plane already taken off" unless @hangar.include?(plane)
    fail "Stormy weather, plane unable to take off" if stormy?
    @hangar.delete(plane)
    "Plane has taken off"
  end

  protected

  def full?
    hangar.length >= @capacity
  end

  def stormy?
    @weather.current_weather == :stormy
  end
end
