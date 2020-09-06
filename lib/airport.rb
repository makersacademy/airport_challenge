require_relative 'plane'

class Airport
  DEFAULT_CAPACITY = 5
  attr_reader :planes
  attr_accessor :capacity

  def initialize(capacity=DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
  end


  
  def land(plane)
    if @planes.count >= @capacity
      fail 'Landing is not currently possible'
    else
      @planes << plane
    end
  end

end
