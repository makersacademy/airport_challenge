require_relative 'plane'

class Airport

  attr_reader :plane
  ::DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def land(plane)
    raise 'Airport full' if full?

    @planes << plane
    puts @planes
  end

  def takeoff
    @planes.pop
  end

  private

  def full?
    @planes.count >= DEFAULT_CAPACITY
  end
  
end
