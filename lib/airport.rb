require './lib/plane.rb'

class Airport

  attr_reader :airport_hanger
  attr_accessor :capacity

  def initialize(capacity = 1)
    @airport_hanger = []
    @capacity = capacity
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
