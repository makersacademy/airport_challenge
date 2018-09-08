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

end
