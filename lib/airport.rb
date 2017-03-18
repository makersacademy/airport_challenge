require './lib/plane.rb'

class Airport

  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def release_plane
    fail "No planes here to fly!" if empty?
    planes.pop
  end

  def accept_plane(plane)
    fail "Airport full!" if full?
    planes << plane
  end



  private

  attr_reader :planes

  def full?
    planes.count >= 20
  end

  def empty?
    planes.empty?
  end

end
