class Airport
  def initialize(capacity)
    @capacity = capacity
    @planes_landed = []
  end

  def land(plane)
    raise 'Airport full' if full?
    raise 'Cannot land plane! Too stormy!' if stormy?
    @planes_landed << plane
  end

  def take_off(plane)
  end

  private
  def full?
    @planes_landed.length >= @capacity
  end

  def stormy?
    rand(1..6) > 4
  end
end
