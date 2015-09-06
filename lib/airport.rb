require_relative "Plane"  # => true

class Airport

DEFAULT_CAPACITY = 3  # => 10

  def initialize
    @capacity = DEFAULT_CAPACITY
    @planes = []
  end

  attr_reader :capacity, :planes  # => nil

  def release_plane(plane)
    fail "No take off allowed while stormy" if Weather.new.stormy?
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

  def stormy?
    if rand(0..9) > 7
      true
    else
     false
    end
  end

  private

end
