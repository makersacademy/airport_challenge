class Airport

  def initialize(capacity)
    @capacity = capacity
    @planes = []
  end

  def land(plane)
    raise 'Cannot land plane: airport is full' if full?
    raise 'Cannot land plane: too stormy' if stormy?
    @planes << plane # storing plane in array instead of storing it in abstract numbers
  end

  def take_off(plane)
  end

  def full?
  @planes.length >= @capacity
  end

  def stormy?
   rand (1...6) > 4
  end
end
