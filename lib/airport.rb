require 'plane'
require 'weather'
class Airport

   attr_reader :planes
   attr_accessor :capacity
  DEFAULT_CAPACITY = 5

  def initialize(capacity=DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def land_plane(plane)
    fail 'airport full' if full?
    @planes << plane 
  end 
  def take_off
    fail 'Plane taken off' if @planes.empty?
    @planes.pop
  end 

  private 
  def full?
    @planes.count >= @capacity
  end

end 