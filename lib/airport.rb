#Airport class
class Airport
  attr_accessor :planes, :capacity
  def initialize
    #create a planes array
    @planes = []
    @capacity = 5 # default capacity is 5
  end
  def land(plane)
    #error when is full
    fail 'Airport is currently full. There is not any space for landing...' if full?
    #and plane will be pushed to planes array
    @planes << plane
  end
  def take_off(plane)
    @planes.delete(plane)
  end
  private
  def full?
    @planes.count >= capacity
  end
end
