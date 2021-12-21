require_relative 'plane'

class Airport
  DEFAULT_CAPACITY = 5
  attr_reader :planes, :capacity
  
  def initialize(capacity=DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
  end

  def land(plane)
    fail 'Airport is full' if full?
    @planes << plane 
  end 

  def take_off
    fail 'Weather too bad to take off' if stormy?
    @planes.pop
  end

  private 

  def full?
    @planes.length >= @capacity
  end

  def stormy?
    rand(1..6) > 4
  end
  
end