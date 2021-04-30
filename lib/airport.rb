class Airport
  def initialize(capacity)
    @capacity = capacity
    @planes = []
  end

  def land(plane)
    raise "Plane cannot land at a full airport!" if full?
    raise "Plane cannot land during stormy conditions!" if stormy?

    @planes << plane
  end

  def take_off(plane)

  end

private

  def full?
    @planes.length >= @capacity
  end

  def stormy?
    rand(1..6) > 4
  end

end
