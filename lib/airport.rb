require_relative "Plane"  # => true
require_relative "weather"

class Airport

DEFAULT_CAPACITY = 3  # => 10




  def initialize
    @capacity = DEFAULT_CAPACITY
    @planes = []
  end

  attr_reader :capacity, :planes  # => nil

  def release_plane(plane)
    fail "No take off allowed while stormy" if stormy
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

  # attr_reader :planes  # => nil



end
