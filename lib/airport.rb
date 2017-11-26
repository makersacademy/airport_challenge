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
    fail "Stormy weather, plane unable to land" if stormy?
    fail "Airport at full capacity, plane unable to land" if full?
    @hangar << plane
    "Plane has landed"
  end

  def take_off
    fail "Stormy weather, plane unable to take off" if stormy?
    fail "No plane for take off" if empty?
    @hangar.pop
    "Plane has taken off"
  end

  protected

  def empty?
    hangar.length.zero? ? true : false
  end

  def full?
    hangar.length >= @capacity ? true : false
  end

  def stormy?
    @weather.current_weather == :stormy ? true : false
  end
end
