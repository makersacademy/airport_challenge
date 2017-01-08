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
    raise "The plane has already landed" if landed?(plane)
    plane.land
    @planes << plane
  end

  def instruct_take_off(plane)
    raise "There are no planes in the airport" if empty?
    raise "The plane has already taken off" if taken_off?(plane)
    plane.taken_off
    @planes.delete(plane)
  end

  def landed?(plane)
    @planes.include?(plane)
  end

  def taken_off?(plane)
    !@planes.include?(plane)
  end

  def full?
    @planes.count >= DEFAULT_CAPACITY
  end

  def empty?
    @planes.count == 0
  end

end
