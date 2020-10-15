class Airport

  attr_accessor :capacity
  attr_reader :plane_count

  def initialize(capacity)
    @capacity = capacity
    @plane_count = 0
  end

  def land
    fail "Cannot land, it's stormy" if stormy?

    fail "Error: Airport full" if @plane_count >= @capacity

    @plane_count += 1
  end

  def take_off
    @plane_count -= 1
  end

  def stormy?
    [true, false].sample
  end
end
