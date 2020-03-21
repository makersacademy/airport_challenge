class Airport
  attr_reader :capacity

  DEFAULT_CAPACITY = 10

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes_landed = 0
  end

  def full?
    @planes_landed == @capacity
  end

  def notify_that_plane_has_landed
    @planes_landed += 1
  end

  def notify_that_plane_has_left
    @planes_landed -= 1
  end
end
