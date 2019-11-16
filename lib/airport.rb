class Airport
  attr_reader :plane
  attr_accessor :capacity

  DEFAULT_CAPACITY = 1

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @counter = 0
  end

  def land(plane)
    if @counter >= @capacity
      raise "That airport is full, cannot land"
    else
      @counter += 1
      "Plane has been landed"
    end
  end

  def take_off(plane)
    "Plane has taken off"
  end
end
