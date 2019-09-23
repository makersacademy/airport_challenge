require_relative 'plane'
require_relative 'weather'

class Airport
  attr_accessor :hangar
  attr_reader :capacity
  DEFAULT_CAPACITY = 50
  include Weather

  def initialize(capacity = DEFAULT_CAPACITY)
    @hangar = []
    @capacity = capacity
  end

  def land_plane(plane)
    fail "Cannot land, airport full" if full?
    fail "Plane is not airborne" if !plane.airborne?
    fail "Cannot land in stormy weather" if stormy?

    plane.lands
    @hangar << plane
  end

  def takeoff_plane(plane)
    fail "No planes available for take off" if @hangar.empty?
    fail "Plane not at airport" if !@hangar.include? plane
    fail "Cannot take off in stormy weather" if stormy?

    @hangar.delete(plane)
    plane.takes_off
    plane
  end

  private

  def full?
    @hangar.size >= @capacity
  end
end
