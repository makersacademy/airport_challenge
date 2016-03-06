class Airport
  DEFAULT_CAPACITY = 20
  attr_reader :capacity, :planes

  def initialize capacity=DEFAULT_CAPACITY
    @capacity = capacity
    @planes = []
  end

  def change_capacity quantity
    @capacity = quantity
  end

  def land *args
    fail 'Airport full - cant\'t land!' if full?
    args.each {|plane| plane.land self}
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
