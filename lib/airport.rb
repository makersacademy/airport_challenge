require_relative 'plane'

class Airport
  attr_accessor :hanger
  attr_reader :capacity
  DEAFUALTCAPACITY = 50

  def initialize(capacity = DEAFUALTCAPACITY)
    @hanger = []
    @capacity = capacity
  end

  def land_plane(plane)
    fail "Cannot land, airport full" if full?
    fail "Plane is not airborne" if !plane.airborne?
    fail "Cannot land in stormy weather" if stormy?

    plane.lands
    @hanger << plane
  end

  def takeoff_plane(plane)
    fail "No planes available for take off" if @hanger.empty?
    fail "Plane not in hanger" if !@hanger.include? plane
    fail "Cannot take off in stormy weather" if stormy?

    @hanger.delete(plane)
    plane.takes_off
    plane
  end

  private

  def stormy?
    rand(1..10) >= 9
  end

  def full?
    @hanger.size >= @capacity
  end
end
