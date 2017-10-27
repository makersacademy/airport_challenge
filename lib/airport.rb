class Airport

  DEFAULT_CAPACITY = 20

  attr_accessor :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def land(plane)
    raise "Too stormy to land!" if stormy?
    raise "Airport is currently full!" if full?
    @planes << plane
  end

  def takeoff
    raise "Too stormy to takeoff!" if stormy?
    if @planes.length > 0
      plane = @planes[-1]
      @planes.pop
      "#{plane} has taken off."
    end
  end

  private

  def stormy?
    random = 1 + rand(5)
    random == 5 ? true : false
  end

  def full?
    @planes.length >= @capacity ? true : false
  end
end
