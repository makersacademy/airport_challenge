class Airport

  def initialize(capacity)
    @capacity = capacity
    @planes = []
  end

  def land(plane)
    raise "ATTENTION - It is not possibile to land because the airport is full!" if full?
    @planes << plane
  end

  def take_off(plane)
  end

  private

  def full?
    @planes.length >= @capacity
  end
end
