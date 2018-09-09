require_relative './plane'

class Airport

  attr_accessor :planes

  def initialize
    @planes = []
    @capacity = 2
  end

  def land(plane)
    fail("weather is too bad for landing") if stormy == true

    if @planes.length == @capacity
      "airport is full - no landings allowed"
    else
      @planes << plane
      "plane has landed"
    end

  end

  def take_off(plane)
    fail("weather is too bad for take-off") if stormy == true
    @planes.pop
    "plane has taken off"
  end

  def planes?
    if @planes.length > 0
      "there are " + @planes.length.to_s + " plane(s) at airport"
    else
      "plane in the air"
    end
  end

  def stormy
    rand(1..100) > 80
  end

  # def capacity
  #   @capacity
  # end

  # def capacity?
  #   p "$$$$$"
  #   @planes.count >= capacity
  #   p "%%%%%"
  # end

end
