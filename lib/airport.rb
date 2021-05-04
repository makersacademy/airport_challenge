require_relative 'plane'
require_relative 'weather'

class Airport

  attr_reader :planes
  attr_accessor :capacity
  DEFAULT_CAPACITY = 10
  
  def initialize(capacity=DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def land_plane(plane)
    fail 'The airport is full' if full?
    @planes.push(plane)
  end

  def takeoff_plane
    @planes.pop
  end

  def full?
    true if @planes.count >= @capacity
  end 

  def override_capacity(new_capacity)
    @capacity = new_capacity
  end

end