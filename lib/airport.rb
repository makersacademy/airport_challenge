class Airport
  attr_accessor :capacity

  DEFAULT_CAPACITY = 10

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes_landed = 0
  end

  def full?
    @planes_landed == @capacity
  end

  def land_plane
    @planes_landed += 1
  end
end
