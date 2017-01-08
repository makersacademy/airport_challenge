require_relative 'plane'

class Airport
  attr_reader :planes
  attr_accessor :capacity

  DEFAULT_CAPACITY = 3

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def instruct_landing(plane)
    raise "There is no space in the airport" if full?
    plane.land
    @planes << plane
  end

  def instruct_take_off(plane)
    raise "There are no planes in the airport" if empty?
    plane.taken_off
    @planes.delete(plane)
  end

  def full?
    @planes.count >= DEFAULT_CAPACITY
  end

  def empty?
    @planes.count == 0
  end

end
