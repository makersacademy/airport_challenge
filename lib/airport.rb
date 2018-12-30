require_relative 'plane.rb'
class Airport

  def initialize(capacity)
    @capacity = capacity
    @hangar = []
  end

  def land(plane)
    raise 'cannot land plane airport full' if full?
    raise 'Cannot land plane: weather is stormy' if stormy?
    @hangar << plane
  end 

  def take_off(plane)
  end 

  private
  def full?
    @hangar.length >= @capacity
  end

  def stormy?
    rand(1..6) > 4
  end 
end 
