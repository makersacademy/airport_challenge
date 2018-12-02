require_relative 'plane'

class Airport
  attr_reader :capacity

  DEFAULT_CAPACITY = 50
  
  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity 
    @hanger = []
  end
  
  def stormy?
    x = rand(1..2)
    if x == 1
      true
    elsif x == 2
      false
    end
  end

  def land(plane)
    fail 'Airport full' if @hanger.length == @capacity
    @plane = plane
    @hanger.push @plane
    @hanger
  end

  def take_off(plane)
    fail 'Planes grounded because of stormy weather' if stormy? 
    @hanger.delete plane
  end
end
