require_relative "plane"
require_relative "weather"

class Airport
  include Weather
  attr_accessor :capacity, :hangar, :planes

  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @hangar = []
  end

  def land_plane(plane)
    fail "airport hangar full - unable to land" if full?
    plane.land
    @hangar << plane
  end

  def plane_take_off(plane)
    plane.take_off
    @hangar.pop
  end

  private

  def full?
    @hangar.size >= capacity
  end

  def empty?
  end

end
