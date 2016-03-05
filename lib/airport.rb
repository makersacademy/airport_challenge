class Airport
  DEFAULT_CAPACITY = 20
  attr_reader :capacity, :planes

  def initialize capacity=DEFAULT_CAPACITY
    @capacity = capacity
    @planes = Array.new
  end

  def change_capacity quantity
    @capacity = quantity
  end

  def land *args
    @planes += args
  end

  def full?
    @planes.length >= 20
  end

  def take_off plane
    plane.take_off
    @planes.delete(plane)
  end
end
