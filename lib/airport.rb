require_relative 'plane'

class Airport

  def stormy?
    number = rand(1..10)
    number > 8 ? true : false
  end

  def land(plane)
    @plane = plane
    weather = self.stormy?
    if weather == true
      fail "Cannot land in STORMY weather"
    else
      "#{@plane} has landed at the airport"
    end
  end

  def take_off
    weather = self.stormy?
    if weather == true
      fail "Cannot take off in STORMY weather"
    elsif @plane == nil
      fail "There are no planes in the airport"
    else
      "#{@plane} has left the airport"
    end
  end

end
