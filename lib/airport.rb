require './lib/plane'

class Airport
  def initialize
    @plane = []
  end

  def land(plane)
    @plane.push(plane)
  end

  def take_off(plane)
    @plane.delete(plane)
    "#{plane} has departed the airport"
  end

  def full?
    if @plane.length >= 3
      true
    else
      false
    end
  end

end
