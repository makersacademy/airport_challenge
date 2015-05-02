class Airport

  attr_accessor :capacity

  def initialize capacity = 10
    @planes = []
    @capacity = capacity
  end

  def receive plane
    if @planes.count == @capacity
      fail 'airport cannot receive planes when at capacity'
    else
      plane.land
      @planes << plane
    end
  end

  def launch plane
    plane.takeoff
    @planes.delete(plane)
  end

  def planes
    @planes
  end

end
