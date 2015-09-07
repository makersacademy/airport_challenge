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
    fail "unable to land" if full? || stormy?
    plane.land
    @hangar << plane
  end

  def plane_take_off(plane)
    fail "unable to take off" if empty? || stormy?
    plane.take_off
    @hangar.pop
  end

  private

  def full?
    @hangar.size >= capacity
  end

  def empty?
    @hangar.empty?
  end

end
