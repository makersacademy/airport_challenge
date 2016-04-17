require_relative 'plane'

class Airport

  attr_reader :planes
  attr_reader :capacity

  def initialize
    @planes = []
    @capacity = 20
  end

  def launch_plane
    raise 'No planes for take off.' if empty? 
    @planes.pop
  end

  def land(plane)
    raise 'Airport is full.' if full?
    @planes << plane
  end

  def full?
    @planes.count == capacity
  end

  def empty? 
    @planes.empty? 
  end

end