require_relative "plane"
require_relative "weather"

class Airport
  attr_reader :hangar

  def initialize
    @hangar = []
  end

  def land(plane)
    @hangar << plane
    "Plane has landed"
  end

  def take_off
    fail "No plane for take off" if hangar.empty?
    @hangar.pop
    "Plane has taken off"
  end

  protected

  def empty?
    hangar.length.zero? ? true : false
  end
end
