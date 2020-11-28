class Airport
  attr_reader :capacity, :ramp

  def initialize
    # default capacity of 1
    @capacity = 1
    # where planes are parked
    @ramp = []
  end

  def full?
    # checks parked planes vs. capacity
    @capacity <= @ramp.count
  end

  def empty?
    @ramp.empty?
  end

end
