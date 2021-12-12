require './lib/plane'
#Airport class
class Airport
  DEFAULT_CAPACITY = 5
  attr_accessor :planes, :capacity
  def initialize(capacity = DEFAULT_CAPACITY)
    #create a planes array
    @planes = []
    @capacity = capacity # Default is 5 but now it can be updated
  end
  def land(plane)
    #error when airport is full
    fail 'Airport is currently full. There is not any space for landing...' if full?
    #and plane will be pushed to planes array
    @planes << plane
  end
  def take_off(plane)
    #take odd a plane
    @planes.delete(plane)
  end
  private
  def full?
    #full method
    @planes.count >= capacity
  end
end
