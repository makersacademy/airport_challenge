require_relative 'plane'

class Airport
  attr_reader :hanger, :capacity

  def initialize(hanger = [], capacity)
    @hanger = []
    @capacity = capacity
  end

  def land(plane)
    @hanger << plane
  end

  def take_off(plane)
    @hanger.delete(plane)
    @hanger
  end

def full?
  if @hanger.length >= @capacity
    true
  end
end

end
