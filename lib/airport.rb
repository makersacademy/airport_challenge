class Airport
  attr_accessor :planes
  attr_accessor :capacity

  def initialize
    @planes = 0
    @capacity = 1
  end

  def check_capacity
    if self.planes == self.capacity
      'full'
    else
      'not full'
    end
  end

  def land_plane
    self.planes += 1
  end

  def takeoff_plane
    self.planes -= 1
  end
end
