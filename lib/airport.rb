require_relative 'plane'

class Airport
  DEFAULT_CAPACITY = 20
  attr_accessor :capacity, :planes

  def initialize(capacity=DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
  end

  def receive_plane(plane)
    @planes << plane
  end

  def release_plane(plane)
    @planes.delete(plane)
  end

  def full?
    @planes.length == @capacity
  end

end
