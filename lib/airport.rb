require_relative 'plane'

class Airport
  DEFAULT_CAPACITY = 3
  attr_reader :planes, :capacity
  attr_accessor :stormy

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @stormy = (rand 100) > 25 ? false : true
    # @stormy = false
    @capacity = capacity
  end


  def report_stormy
    @stormy = true
  end

  def take_off
    raise 'Sorry, no taking off in stormy weather' if stormy
    planes[planes.count - 1].fly
    planes.pop
  end

  def land(plane)
    raise 'That plane is already on the ground!' if plane.landed
    raise 'Sorry, no landing in stormy weather' if stormy
    raise 'Sorry, the airport is full' if planes.count == capacity
    puts plane.land
    plane.land
    planes << plane
  end
end
