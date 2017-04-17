require_relative 'plane'
class Airport

  DEFAULT_CAPACITY = 20

  # use 'attr_reader :planes' instead, or better,
  # create a custom method to
  # check whether or not a plane has landed
  attr_reader :planes, :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end


  def land(plane)
    fail 'Airport is full' if full?
    @planes << plane
  end

  def take_off(plane)
    @planes.pop
  end

private
def full?
  @planes.length >= DEFAULT_CAPACITY
end

end
