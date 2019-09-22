require_relative 'plane'

class Airport
  attr_accessor :hanger, :capacity
  DEAFUALTCAPACITY = 50
  def initialize(capacity = DEAFUALTCAPACITY)
    @hanger = []
    @capacity = capacity
  end

  def land_plane(plane)
    fail "Cannot land, airport full" if full?
    fail "Cannot land in stormy weather" if stormy?

    @hanger << plane
  end

  def takeoff_plane(plane)
    fail "No planes available for take off" if @hanger.empty?
    fail "Cannot take off in stormy weather" if stormy?

    @hanger.delete(plane)
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
