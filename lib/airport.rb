class Airport

  def initialize(capacity)
    @capacity = capacity
    @planes = []
  end

  def land(plane)
    raise 'Cannot land plane: airport is full' if @planes.length >= @capacity
    @planes << plane # storing plane in array instead of storing it in abstract numbers
  end

  def take_off(plane)
  end
end
