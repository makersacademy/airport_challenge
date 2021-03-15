class Airport 

  def initialize
    @planes = (1)
    @capacity = (10)
  end

  def planes_landed
    @planes
  end

  def land(inc)
    fail 'Airport is full' unless @planes
    @plane += inc
  end

  def full
    @plane <= @capacity
    if true
      return
    end
  end
end

airport = Airport.new
