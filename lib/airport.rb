require_relative './plane'

class Airport
  DEFAULT_CAPACITY = 2
  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end
  
  attr_accessor :planes, :capacity

  def land_plane(plane)
    raise "Airport is full" if full?
    @planes << plane
  end
  
  def take_off(plane)
    @planes.pop
    #@planes.each_with_index do |plane, index| 
     #   if bike.working?
      #    @.delete_at(index)
       #   return bike
    " #{plane} has left the airport"
  end


  private
  def full?
    @planes.count == @capacity 
  end
  

end
