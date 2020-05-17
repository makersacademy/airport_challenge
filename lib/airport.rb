# require './lib/plane'

class Airport

  attr_reader :airport_hanger

  def initialize
    @airport_hanger = []
    @capacity = 1
  end

  def land(plane)
    raise StopIteration if full?

    @airport_hanger << plane
    plane
  end

  def take_off(plane)
    @plane = plane
  end
  
  private

  def full?
    @airport_hanger.length == @capacity
  end

end
