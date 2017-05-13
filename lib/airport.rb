require_relative 'plane'

class Airport
  attr_accessor :capacity
  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @landed_planes = []
  end

  def land(plane)
    fail "Cannot land as airport is full!!" if full?
    plane.status_landed
    @landed_planes << plane
    self
  end

  def take_off(plane)
    fail "There are no planes to take off!!" if empty?
    plane.status_takenoff
    @landed_planes.delete(plane)
  end

private
  attr_reader :landed_planes

  def full?
    @landed_planes.count >= DEFAULT_CAPACITY
  end

  def empty?
    @landed_planes.empty?
  end


end
