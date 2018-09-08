require_relative './plane'

class Airport

  attr_accessor :planes

  def initialize
    @planes = []
  end

  def land(plane)
    @planes << plane
    "plane has landed"
  end

  def take_off(plane)
    fail("weather is too bad for take-off") if stormy == true
    @planes.pop
    "plane has taken off"
  end

  def planes?
    if @planes.length > 0
      "plane at airport"
    else
      "plane in the air"
    end
  end

  def stormy
    rand(1..100) > 80
  end

end
