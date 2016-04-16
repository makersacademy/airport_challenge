require_relative 'weather'
require_relative 'plane'

class Airport
DEFAULT_CAPACITY= 20
  attr_accessor :capacity



    def initialize(capacity= DEFAULT_CAPACITY)
      @capacity = capacity
       @planes = []


    end
  def accept_for_take_off(plane)
  end

  def accept_for_landing(plane)
   raise "Airport is full" if full?
   @planes << plane
  end
   private
#
#
 def full?
 @planes.count >= capacity
 end
end
