require_relative 'plane'

class Airport

  def stormy?
    number = rand(1..10)
    if number > 8
      true
    else
      false
    end
  end

  def land(plane)
    @plane = plane
  end

  def take_off
    "#{@plane} has left the airport"
  end

end
