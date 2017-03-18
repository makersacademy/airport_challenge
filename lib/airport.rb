require './lib/plane.rb'

class Airport

  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def release_plane(plane)
    fail "No planes here to fly!" if empty?
    fail "Too stormy to fly!" if plane.stormy == true
    plane.flying = true
    planes.delete(plane)
  end

  def accept_plane(plane)
    fail "Airport full!" if full?
    fail "Plane already landed!" if plane.flying == false
    plane.flying = false
    planes << plane
  end


  private
  attr_reader :planes, :capacity

  def full?
    planes.count >= capacity
  end

  def empty?
    planes.empty?
  end

end
