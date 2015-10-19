require_relative 'plane'
require_relative 'weather'

class Airport

  include Weather

  attr_accessor :planes
  attr_accessor :capacity

  def initialize (capacity = 50)
    @capacity = capacity
    @planes = []
  end

  def instruct_to_land(plane)
    fail 'The airport is full.' if full?
    fail 'The weather is stormy, landing is not allowed.' if stormy?
    @planes << plane
    @planes.last
  end

  def instruct_to_take_off(plane)
    fail 'The weather is stormy, taking off is not allowed.' if stormy?
    index = @planes.index {|n| n == plane}
    plane_taking_off = @planes.delete_at(index)
  end

  def full?
    @planes.count >= @capacity ? true : false
  end

end
