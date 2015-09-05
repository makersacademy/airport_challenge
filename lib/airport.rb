require_relative "Plane"  # => true

class Airport

DEFAULT_CAPACITY = 10  # => 10


  def initialize
    @capacity = DEFAULT_CAPACITY
    @planes = []
  end

  attr_reader :capacity  # => nil

  def release_plane
   planes.pop
   "Cleared for takeoff"
  end

  def receive_plane(plane)
    fail "Airport full" if full?
    planes << plane
  end

  def full?
    if planes.length >= @capacity
      true
    else
      false
    end
  end

  private

  attr_reader :planes  # => nil



end
