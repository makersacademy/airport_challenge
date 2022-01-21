class Airport
  attr_accessor :capacity

  def initialize(capacity = 5)
    @capacity = capacity
  end

  def land(plane)
    raise if @capacity.zero?
    @capacity -= 1
  end

  def take_off(plane)
    @capacity += 1
  end
end
