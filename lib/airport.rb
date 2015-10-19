require_relative 'plane'
class Airport

  DEFAULT_CAPACITY = 20

  # this should be refactored out, it's a hangover from a previous version
  # use 'attr_reader :planes' instead, or better, create a custom method to
  # check whether or not a plane has landed
  attr_reader :plane

  def initialize
    @planes = []
  end

  def land(plane)
    # this line is redundant, 'plane' is a local variable of the method already
    @plane = plane
    fail 'Airport is full' if full?
    @planes << plane
  end

  # this method shouldn't create a new plane out of thin air!
  def take_off(plane)
    Plane.new
  end

private
def full?
  @planes.length >= DEFAULT_CAPACITY
end

end
