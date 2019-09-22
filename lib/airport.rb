require_relative 'plane'

class Airport

  def stormy?
    number = rand(1..10)
    number > 8 ? true : false
  end

  def land(plane)
    @plane = plane
  end

  def take_off
    weather = self.stormy?
    if weather == true
      fail "Cannot take off in STORMY weather"
    else
      "#{@plane} has left the airport"
    end
  end

end
