require_relative 'plane'

class Airport

  attr_reader :planes
  attr_reader :capacity
  
  DEFAULT_CAPACITY = 2

  def initialize
    @planes = []
    @capacity = DEFAULT_CAPACITY
  end
 
  def land_plane(plane)
    fail 'Airport is full' if full?

    @planes.push(plane)
  end

  def take_off(*)
    fail 'Airport is empty' if empty?

    @planes.pop
  end

  private

  def full?
    @planes.count >= @capacity
  end

  def empty?
    @planes.empty?
  end
end
