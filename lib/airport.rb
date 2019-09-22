require_relative 'plane'
require_relative 'weather'

class Airport
  attr_accessor :hanger
  attr_reader :capacity
  DEAFUALTCAPACITY = 50

  def initialize(capacity = DEAFUALTCAPACITY)
    @hanger = []
    @capacity = capacity
  end

  def land_plane(plane, weather)
    fail "Cannot land, airport full" if full?
    fail "Plane is not airborne" if !plane.airborne?
    fail "Cannot land in stormy weather" if weather.stormy?

    plane.lands
    @hanger << plane
  end

  def takeoff_plane(plane, weather)
    fail "No planes available for take off" if @hanger.empty?
    fail "Plane not at airport" if !@hanger.include? plane
    fail "Cannot take off in stormy weather" if weather.stormy?

    @hanger.delete(plane)
    plane.takes_off
    plane
  end

  private

  def full?
    @hanger.size >= @capacity
  end
end
