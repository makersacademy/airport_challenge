class Airport
  
  attr_accessor :capacity
  attr_accessor :planes
  
  def initialize
    @capacity = 10
    @planes = 0
  end

  def add_plane
    @planes += 1
  end

  def remove_plane
    @planes -= 1
  end

  def full?
    @planes == @capacity
  end

end
