require "planes"

class Airport
  attr_accessor :airport, :cap

  def initialize
    @airport = []
    @cap = 10
  end

  def capacity_change(capacity)
    @cap = capacity
  end

  def land(plane)
    if @airport.length < @cap
      @airport << plane
    else
      raise RuntimeError, "The airport has reached capacity. This plane will be unable to land."
    end
  end

  def takeoff(plane)
    @airport.slice!(-1)
    puts "This plane has taken off"
  end
end