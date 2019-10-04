class Airport

  CAPACITY = 5
  attr_accessor :capacity
  def initialize
    @planes = []
    @capacity = CAPACITY
  end

  def inventory
    @planes
  end

  def land(plane)
    fail 'no room' if full?

    @planes << plane
  end

  def fly(plane)
    for i in (0...@planes.count)
      if @planes[i] == plane
        temp = @planes[i]
        @planes.delete_at(i)
      end
    end
    temp
  end

  private

  def full?
    @planes.count >= @capacity
  end

end
