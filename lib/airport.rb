require_relative 'plane'

class Airport
  attr_reader :planes
  CAPACITY = 5
  
  def initialize
    @planes = []
    @capacity = CAPACITY
  end

  def capacity(num)
    @capacity = num
  end

  def land(plane)
    fail "Too stormy to land" if stormy?
    fail "plane already at airport" if @planes.include?(plane)
    fail "The airport is full" if full?

    @planes << plane
  end

  def take_off(plane)
    fail "no planes to take off " unless @planes.any?
      
    @planes.pop
    "The plane has taken off"
  end

  private
  def full?
    @planes.count >= @capacity
  end

  def add_plane(plane)
    @planes << plane
  end

  def stormy?
    rand(6)== 5
  end
end