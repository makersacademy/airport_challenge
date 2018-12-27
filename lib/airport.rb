require_relative 'plane.rb'
class Airport

  def initialize(capacity)
    @capacity = capacity
    @planes = []
  end


  def land(plane)
    raise 'cannot land plane airport full' if full?
    @planes << plane
  end 

  def take_off(plane)
  end 

  private
  def full?
    @planes.length >= @capacity
  end
end 
