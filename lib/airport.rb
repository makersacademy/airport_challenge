require_relative 'plane'

class Airport
  attr_reader :landed, :capacity  
  DEFAULT_CAPACITY = 10 

  def initialize (capacity=DEFAULT_CAPACITY)
    @landed = []
    @capacity = capacity
  end

  def land(plane)
    raise 'Not accepting more planes to land' if full?
    landed << plane
  end

  def take_off
    landed.each_with_index {|plane,index| landed.delete_at(index) ; return plane}
  end

  def full?
    @landed.length >= capacity
  end
    
end