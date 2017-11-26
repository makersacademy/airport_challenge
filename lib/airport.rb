require_relative "plane"
require_relative "weather"

class Airport
  CAPACITY = 10
  attr_reader :hangar

  def initialize
    @hangar = []
    @capacity = CAPACITY
  end

  def land(plane)
    fail "Airport at full capacity, plane unable to land" if full?
    @hangar << plane
    "Plane has landed"
  end

  def take_off
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
end
