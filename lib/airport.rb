class Airport
  CAPACITY = 5
  attr_accessor :capacity
  def initialize(input = CAPACITY)
    @planes, @capacity = [], input
  end

  def conditions(input)
    @wheather = input
  end

  def inventory
    @planes
  end

  def land(plane)
    fail 'no room' if full?
    fail 'bad wheather' if wheather?

    @planes << plane
  end

  def fly(plane)
    fail 'bad wheather' if wheather?

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

  def wheather?
    @wheather == 'stormy'
  end
end
