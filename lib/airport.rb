require_relative 'plane'

class Airport

  DEFAULT_CAPACITY = 50
  attr_reader :planes, :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
  end


  def land(plane)
    #plane.landed
    @planes << plane
  end


  def take_off(plane)
    #plane.take_off
    @planes.pop

  end

private

  def full?

    @planes.length >= capacity

  end

end
