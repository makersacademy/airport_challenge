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
    fail "plane already at airport" if @planes.include?(plane)
    fail "The airport is full" if full?
    @planes << plane
  end

  def take_off(plane)
    if @planes.any?
      @planes.pop
      "The plane has taken off"
    else
      fail "no planes to take off"
    end
  end

  private
  def full?
    @planes.count >= @capacity
  end

  def empty?
    @planes.count == 0
  end

  def add_plane(plane)
    @planes << plane
  end

end

class Plane
end
