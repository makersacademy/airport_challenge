require_relative "./plane"

class Airport
  
  DEFAULT_CAPACITY = 20
  attr_reader :plane_list
  attr_accessor :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @plane_list = []
    @capacity = capacity
  end

  def land(plane)   
    raise "airport full" if full?
    raise "There is a storm preventing landing" if storm?
    @plane_list << plane
  end

  def take_off(plane)
    raise "There is a storm preventing take-off" if storm?
    @plane_list.delete(plane)
  end

  def full?
    @plane_list.length >= capacity
  end

  private

  def storm?
    rand(20) == 20
  end

end
