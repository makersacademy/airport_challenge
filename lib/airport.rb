require_relative 'plane'

class Airport
  attr_reader :plane, :capacity
  
  DEFAULT_CAPACITY = 10

  def initialize(capacity=DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def lands(plane)
    fail 'Airport full - do not land!' if @planes.count >= @capacity
    @planes << plane
  end
  
  def takesoff
    fail 'No planes available' if @planes.empty?
    @planes.pop
  end
end