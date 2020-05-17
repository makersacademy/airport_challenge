# require './lib/plane'

class Airport

   attr_reader :capacity

  def initialize
    @capacity = [] 
  end

  def land(plane)
    raise StopIteration if full?
    @capacity << plane
    plane
  end

  def take_off(plane)
    @plane = plane
  end
  
  private

    def full?
      @capacity.length == 1
    end

end
