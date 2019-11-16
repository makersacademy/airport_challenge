class Airport
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
    if self.weather == "stormy"
      raise "Weather is stormy, cannot takeoff"
    else
      "Plane has taken off"
    end
  end

  def weather # Weather has a 20% chance to be stormy
    n = rand(5)
    n == 0 ? "stormy" : "sunny"
  end

end
