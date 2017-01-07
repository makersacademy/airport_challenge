require_relative 'plane'

class Airport
  attr_reader :planes
  attr_accessor :capacity

  DEFAULT_CAPACITY = 1

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def instruct_landing(plane)
    raise "There is no space in the airport" if @planes.count >= DEFAULT_CAPACITY
    plane.land
    @planes << plane
  end

  def instruct_take_off(plane)
    raise "There are no planes in the airport" if @planes.count == 0
    plane.taken_off
    @planes.delete(plane)
  end

  def landed?(plane)
    @planes.include?(plane)
  end

  def taken_off?(plane)
    !@planes.include?(plane)
  end

end
