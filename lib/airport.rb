require_relative 'plane'

class Airport

  DEFAULT_CAPACITY = 50
  
  attr_reader :planes
  attr_accessor :capacity


  def initialize
    @planes = []
    @capacity = DEFAULT_CAPACITY
  end

  def launch_plane
    raise 'No planes for take off.' if empty? 
    @planes.pop
  end

  def land(plane)
    raise 'Airport is full.' if full?
    @planes << plane
  end

  private

  def full?
    @planes.count == DEFAULT_CAPACITY
  end

  def empty? 
    @planes.empty? 
  end

end