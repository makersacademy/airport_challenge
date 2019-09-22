require_relative 'plane'

class Airport
  attr_accessor :hanger

  def initialize
    @hanger = []
  end

  def land_plane(plane)
    fail "Cannot land in stormy weather" if stormy?
    @hanger << plane
  end

  def takeoff_plane(plane)
    fail "Cannot take off in stormy weather" if stormy?
    @hanger.delete(plane)
    plane
  end

  private

  def stormy?
    rand(1..10) >= 9
  end

end
